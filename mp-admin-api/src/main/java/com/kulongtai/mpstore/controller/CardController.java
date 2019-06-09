package com.kulongtai.mpstore.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kulongtai.mpstore.common.R;
import com.kulongtai.mpstore.dto.CardListDto;
import com.kulongtai.mpstore.dto.UserListDto;
import com.kulongtai.mpstore.entity.Card;
import com.kulongtai.mpstore.entity.User;
import com.kulongtai.mpstore.service.ICardService;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * <p>
 * 用户卡券表 前端控制器
 * </p>
 *
 * @author lijinliang
 * @since 2019-06-09
 */
@RestController
@RequestMapping("/card")
public class CardController {
    @Autowired
    private ICardService iCardService;
    @GetMapping("/getCardList")
    @ApiOperation(value="查询卡券列表", notes="需传入分页参数")
    public R<IPage> getCardList(CardListDto cardListDto) {
        QueryWrapper<Card> queryWrapper = Wrappers.<Card>query();
        queryWrapper.like(StringUtils.isNotBlank(cardListDto.getUserId()),"user_id",cardListDto.getUserId())
                .eq(StringUtils.isNotBlank(cardListDto.getOrderNo()),"order_no",cardListDto.getOrderNo())
                .eq(StringUtils.isNotBlank(cardListDto.getCardNo()),"card_no",cardListDto.getCardNo())
                .eq(StringUtils.isNotBlank(cardListDto.getValidFlag()),"valid_flag",cardListDto.getValidFlag())
                .gt(cardListDto.getStartTime()!=null,"create_time",cardListDto.getStartTime())
                .lt(cardListDto.getEndTime()!=null,"create_time",cardListDto.getEndTime())
                .orderByDesc("create_time");
        IPage<Card> cardList = iCardService.page(new Page<>(cardListDto.getCurrent(),cardListDto.getSize()),queryWrapper);
        return new R(cardList);
    }
    @PostMapping("/consumeServiceCard")
    @ApiOperation(value="消费服务卡", notes="服务卡一次扣减所有金额并失效")
    public R<Boolean> consumeServiceCard(Integer cardNo){
        return new R( iCardService.consumeServiceCard(cardNo));
    }
    @PostMapping("/consumeECard")
    @ApiOperation(value="消费E卡", notes="E卡，扣减金额")
    public R<Boolean> consumeECard(Integer cardNo, BigDecimal consumeMoney){
        return new R( iCardService.consumeECard(cardNo,consumeMoney));
    }
}
