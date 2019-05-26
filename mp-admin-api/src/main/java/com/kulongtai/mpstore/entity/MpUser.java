package com.kulongtai.mpstore.entity;

    import com.baomidou.mybatisplus.extension.activerecord.Model;
    import java.time.LocalDate;
    import java.time.LocalDateTime;
    import java.io.Serializable;
    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
    import lombok.Data;
    import lombok.EqualsAndHashCode;
    import lombok.experimental.Accessors;

/**
* <p>
    * 微信用户表
    * </p>
*
* @author lijinliang
* @since 2019-05-25
*/
    @Data
        @EqualsAndHashCode(callSuper = false)
    @Accessors(chain = true)
    @ApiModel(value="MpUser对象", description="微信用户表")
    public class MpUser extends Model<MpUser> {

    private static final long serialVersionUID = 1L;

            @ApiModelProperty(value = "用户名称")
    private String username;

            @ApiModelProperty(value = "用户密码")
    private String password;

            @ApiModelProperty(value = "性别：0 未知， 1男， 1 女")
    private Integer gender;

            @ApiModelProperty(value = "生日")
    private LocalDate birthday;

            @ApiModelProperty(value = "最近一次登录时间")
    private LocalDateTime lastLoginTime;

            @ApiModelProperty(value = "0 普通用户，1 VIP用户，2 高级VIP用户")
    private Integer userLevel;

            @ApiModelProperty(value = "用户昵称或网络名称")
    private String nickname;

            @ApiModelProperty(value = "用户手机号码")
    private String mobile;

            @ApiModelProperty(value = "用户头像图片")
    private String avatar;

            @ApiModelProperty(value = "微信登录openid")
    private String weixinOpenid;

            @ApiModelProperty(value = "微信登录会话KEY")
    private String sessionKey;

            @ApiModelProperty(value = "0 可用, 1 禁用, 2 注销")
    private Integer status;

            @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

            @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

            @ApiModelProperty(value = "逻辑删除")
    private Boolean delFlag;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
