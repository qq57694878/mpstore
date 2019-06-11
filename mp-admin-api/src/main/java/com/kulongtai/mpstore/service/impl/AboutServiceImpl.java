package com.kulongtai.mpstore.service.impl;

import com.kulongtai.mpstore.entity.About;
import com.kulongtai.mpstore.mapper.AboutMapper;
import com.kulongtai.mpstore.service.IAboutService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 关于我们表 服务实现类
 * </p>
 *
 * @author lijinliang
 * @since 2019-06-11
 */
@Service
public class AboutServiceImpl extends ServiceImpl<AboutMapper, About> implements IAboutService {

}
