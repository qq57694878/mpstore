package com.kulongtai.mpstore.controller;

import org.apache.commons.io.IOUtils;
import org.apache.http.entity.ContentType;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by Administrator on 2019/5/23 0023.
 */
@Controller
public class DownloadController {
    @Value("${mpstore.file.upload-path}")
    private String uploadPath;
    @GetMapping("/media/**")
    public void download(HttpServletRequest request, HttpServletResponse response)throws Exception{
        String uri= request.getRequestURI();
        String contentPath = request.getContextPath();
        String filePath = uri.substring(contentPath.length()+6);

        //获得需下载的文件
        File file  =new File(uploadPath+filePath);
        uri = uri.replace('\\','/');
        String  fileName = uri.substring(uri.lastIndexOf("/")+1);
        //设置response 参数
        response.addHeader("Content-Disposition","attachment;filename=" + new String(fileName.getBytes(),"utf-8"));
        InputStream is =  new FileInputStream(file);
        OutputStream os = response.getOutputStream();
        IOUtils.copy(is,os);
        is.close();
        os.close();
    }
}
