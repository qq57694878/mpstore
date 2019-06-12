package com.kulongtai.mpstore.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.kulongtai.mpstore.common.R;
import com.kulongtai.mpstore.common.context.BaseContextHandler;
import com.kulongtai.mpstore.dto.OrderListDto;
import com.kulongtai.mpstore.entity.Order;
import com.kulongtai.mpstore.entity.OrderSku;
import com.kulongtai.mpstore.entity.User;
import com.kulongtai.mpstore.service.IOrderService;
import com.kulongtai.mpstore.service.IOrderSkuService;
import com.kulongtai.mpstore.service.IUserService;
import com.kulongtai.mpstore.vo.OrderInfo;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author lijinliang
 * @since 2019-06-13
 */
@RestController
@RequestMapping("/mpapi/order")
public class OrderController {
    @Autowired
    private IOrderService iOrderService;
    @Autowired
    private IUserService iUserService;
    @Autowired
    private IOrderSkuService iOrderSkuService;

    @GetMapping("/getMyOrderList")
    @ApiOperation(value="查询订单列表", notes="需传入分页参数")
    public R<IPage> getMyOrderList(OrderListDto orderListDto) {
        List<OrderInfo>result = new ArrayList<>();
        QueryWrapper<Order> queryWrapper = Wrappers.query();
        Integer userId = BaseContextHandler.getUserID();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq(StringUtils.isNotEmpty(orderListDto.getOrderStatus()),"order_status",orderListDto);
        List<Order>orderList= iOrderService.list(queryWrapper);

        if(orderList!=null&&orderList.size()>0){
            List<Integer>orderIdlist = orderList.stream().map(orderInfo -> {return orderInfo.getOrderId();}).collect(Collectors.toList());
            List<OrderSku> orderSkuList =  iOrderSkuService.list(Wrappers.<OrderSku>query().in("order_id",orderIdlist));
            Map<Integer,List<OrderSku>> orderSkuMap = new HashMap<>();
            orderSkuList.stream().forEach(o -> {
                List<OrderSku>list = orderSkuMap.get(o.getOrderId());
                if(list==null){
                    list = new ArrayList<OrderSku>();
                    orderSkuMap.put(o.getOrderId(),list);
                }
                list.add(o);
            });
            orderList.forEach(order -> {
                OrderInfo orderInfo = new OrderInfo();
                BeanUtils.copyProperties(order,orderInfo);
                orderInfo.setSkuList(orderSkuMap.get(order.getOrderId()));
                result.add(orderInfo);
            });
        }
        return new R(result);
    }
    @GetMapping("/getOrderDetail")
    @ApiOperation(value="查询订单详情")
    @ApiImplicitParam(paramType="query", name = "id", value = "订单id", required = true, dataType = "Integer")
    public R getOrderDetail(@RequestParam(required = true) Integer id) {
        Order order = iOrderService.getById(id);
        OrderInfo orderInfo = new OrderInfo();
        BeanUtils.copyProperties(order,orderInfo);

        QueryWrapper<OrderSku> queryWrapper = Wrappers.query();
        queryWrapper.eq("order_id",id);
        List<OrderSku> skuList =  iOrderSkuService.list(queryWrapper);
        orderInfo.setSkuList(skuList);
        return new R(orderInfo);
    }
}
