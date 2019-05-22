package com.kulongtai.mpstore.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2019/5/1 0001.
 */
@RestController
@RequestMapping("/")
public class HiController {
    @GetMapping("/hello")
    public String hello(){
        return "hello";
    }
}
