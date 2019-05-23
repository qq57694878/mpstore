package com.kulongtai.mpstore.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2019/5/23 0023.
 */
@RestController
public class DownloadController {
    @GetMapping("/doc/**")
    public String download(HttpServletRequest request, HttpServletResponse response){
       String dd= request.getRequestURI();
        return "1";
    }
}
