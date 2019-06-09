package com.kulongtai.mpstore.entity;

    import java.math.BigDecimal;
    import com.baomidou.mybatisplus.annotation.TableName;
    import com.baomidou.mybatisplus.annotation.IdType;
    import com.baomidou.mybatisplus.extension.activerecord.Model;
    import com.baomidou.mybatisplus.annotation.TableId;
    import com.baomidou.mybatisplus.annotation.TableField;
    import java.io.Serializable;
    import java.util.Date;

    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
    import lombok.Data;
    import lombok.EqualsAndHashCode;
    import lombok.experimental.Accessors;

/**
* <p>
    * 用户卡券消费记录表
    * </p>
*
* @author lijinliang
* @since 2019-06-02
*/
    @Data
        @EqualsAndHashCode(callSuper = false)
    @Accessors(chain = true)
    @TableName("mp_card_record")
    @ApiModel(value="CardRecord对象", description="用户卡券消费记录表")
    public class CardRecord extends Model<CardRecord> {

    private static final long serialVersionUID = 1L;

            @ApiModelProperty(value = "id")
            @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

            @ApiModelProperty(value = "卡券id")
        @TableField("card_id")
    private Integer cardId;

            @ApiModelProperty(value = "卡券消费码")
        @TableField("card_no")
    private Integer cardNo;

            @ApiModelProperty(value = "用户id")
        @TableField("user_id")
    private Integer userId;

            @ApiModelProperty(value = "消费前余额")
        @TableField("before_used_price")
    private BigDecimal beforeUsedPrice;

            @ApiModelProperty(value = "消费金额")
        @TableField("used_price")
    private BigDecimal usedPrice;

            @ApiModelProperty(value = "消费后余额")
        @TableField("agter_used_price")
    private BigDecimal agterUsedPrice;

            @ApiModelProperty(value = "业务分类（1服务2充值卡3商品4套餐）")
        @TableField("buss_type")
    private String bussType;

            @ApiModelProperty(value = "创建时间")
        @TableField("create_time")
    private Date createTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
