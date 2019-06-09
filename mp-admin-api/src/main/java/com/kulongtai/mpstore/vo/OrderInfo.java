package com.kulongtai.mpstore.vo;

import com.kulongtai.mpstore.entity.Order;
import com.kulongtai.mpstore.entity.OrderSku;
import com.kulongtai.mpstore.entity.Sku;
import lombok.Data;

import java.util.List;

/**
 * Created by Administrator on 2019/6/8 0008.
 */
@Data
public class OrderInfo extends Order{
    private String mobile;
    private String nickname;
    private List<OrderSku> skuList;

}
