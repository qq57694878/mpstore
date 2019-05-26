package com.kulongtai.mpstore.service.impl;

import com.kulongtai.mpstore.entity.MpUser;
import com.kulongtai.mpstore.mapper.MpUserMapper;
import com.kulongtai.mpstore.service.IMpUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 微信用户表 服务实现类
 * </p>
 *
 * @author lijinliang
 * @since 2019-05-25
 */
@Service
public class MpUserServiceImpl extends ServiceImpl<MpUserMapper, MpUser> implements IMpUserService {

}
