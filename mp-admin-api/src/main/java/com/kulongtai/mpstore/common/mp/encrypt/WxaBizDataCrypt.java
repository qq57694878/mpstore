/**
 * Copyright (c) 2011-2014, L.cm 卢春梦 (qq596392912@gmail.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.kulongtai.mpstore.common.mp.encrypt;


import com.google.common.base.Charsets;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.AlgorithmParameters;
import java.security.Key;
import java.util.Base64;

/**
 * 微信小程序-加密数据解密算法
 * @author L.cm
 */
public class WxaBizDataCrypt {
    private final String sessionKey;

    public WxaBizDataCrypt(String sessionKey) {
        this.sessionKey = sessionKey;
    }

    /**
     * AES解密
     * @param encryptedData 密文
     * @param ivStr iv
     * @return {String}
     */
    public String decrypt(String encryptedData, String ivStr) {
        byte[] bizData = Base64.getDecoder().decode(encryptedData);
        byte[] keyByte = Base64.getDecoder().decode(sessionKey);
        byte[] ivByte  = Base64.getDecoder().decode(ivStr);
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            Key sKeySpec = new SecretKeySpec(keyByte, "AES");
            // 初始化
            AlgorithmParameters params = AlgorithmParameters.getInstance("AES");
            params.init(new IvParameterSpec(ivByte));
            cipher.init(Cipher.DECRYPT_MODE, sKeySpec, params);
            byte[] original = cipher.doFinal(bizData);
            // 去除补位字符
            byte[] result = PKCS7Encoder.decode(original);
            return new String(result, Charsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException("aes解密失败");
        }
    }

}
