package com.kulongtai.mpstore.common;



import lombok.Data;

import java.io.Serializable;

/**
 * api 返回结果
 */
@Data
public class R implements Serializable {

    private int code;

    private String msg;

    private Object data;

    public R() {}


    public R(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public R(Object data) {
        this.code = 200;
        this.msg="";
        this.data = data;
    }
    public R(int code, String msg) {
        this.code = code;
        this.msg = msg;
        this.data = "";
    }
 
}
