package com.kulongtai.mpstore.vo;

import com.kulongtai.mpstore.entity.Order;
import com.kulongtai.mpstore.entity.OrderSku;
import lombok.Data;

import java.util.List;

/**
 * Created by Administrator on 2019/6/8 0008.
 */
@Data
public class OrderInfo extends Order{
    private List<OrderSku> skuList;

}
