package com.kulongtai.mpstore.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kulongtai.mpstore.common.R;
import com.kulongtai.mpstore.dto.SkuListDto;
import com.kulongtai.mpstore.entity.Sku;
import com.kulongtai.mpstore.service.ISkuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 商品信息表 前端控制器
 * </p>
 *
 * @author lijinliang
 * @since 2019-06-02
 */
@RestController
@RequestMapping("/api/sku")
public class SkuController {
    @Autowired
    private ISkuService iSkuService;

    @RequestMapping("/getSkuList")
    public R getSkuList(SkuListDto skuListDto) {
        QueryWrapper<Sku> queryWrapper = Wrappers.<Sku>query();
        queryWrapper.like(StringUtils.isNotBlank(skuListDto.getSkuName()),"sku_name",skuListDto.getSkuName()).eq(StringUtils.isNotBlank(skuListDto.getSkuStatus()),"sku_status",skuListDto.getSkuStatus());
        queryWrapper.orderByDesc("create_time");
        IPage<Sku> skuList = iSkuService.page(new Page<>(skuListDto.getCurrent(),skuListDto.getSize()),queryWrapper);
        return new R(skuList);
    }
}
