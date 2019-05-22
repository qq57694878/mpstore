package com.kulongtai.mpstore.common;



import java.io.Serializable;

/**
 * api 返回结果
 */
public class R implements Serializable {

    private int errcode;

    private String errmsg;

    private Object data;

    public R() {}


    public R(int errcode, String errmsg, Object data) {
        this.errcode = errcode;
        this.errmsg = errmsg;
        this.data = data;
    }

    public R(Object data) {
        this.errcode = 200;
        this.errmsg="";
        this.data = data;
    }
    public R(int errcode, String errmsg) {
        this.errcode = errcode;
        this.errmsg = errmsg;
        this.data = "";
    }

    public int getErrcode() {
        return errcode;
    }

    public void setErrcode(int errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
