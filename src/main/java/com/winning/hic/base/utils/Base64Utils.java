package com.winning.hic.base.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.codec.binary.Base64;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

/**
 * 编码
 *
 * @author ChenKuai
 * @create 2018-03-01 下午 6:36
 **/
public class Base64Utils {

    public static void main(String[] args) throws Exception {


    }

    /**
     * BASE64解密
     *
     * @param key
     * @return
     * @throws Exception
     */
    public static byte[] decryptBASE64(String key) throws Exception {
        return (new BASE64Decoder()).decodeBuffer(key);
    }

    /**
     * BASE64加密
     *
     * @param key
     * @return
     * @throws Exception
     */
    public static String encryptBASE64(byte[] key) throws Exception {
        return (new BASE64Encoder()).encodeBuffer(key);
    }

    /**
     * 解压解密EMR病历内容
     * @param emrContent
     * @return
     */
    public static String unzipEmrXml(String emrContent) throws IOException {
        if (emrContent.indexOf("winningemr") == 0 && emrContent.lastIndexOf("winningemr") == (emrContent.length() - 10))
            emrContent = emrContent.substring(10, emrContent.length() - 20 - 1);
        byte[] arr = Base64.decodeBase64(emrContent);
        ByteArrayInputStream ms = new ByteArrayInputStream(arr);
        InflaterInputStream inflater = new InflaterInputStream(ms, new Inflater(true));
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        int len = 0;
        byte[] part = new byte[1024];
        try {
            while (true) {
                len = inflater.read(part);
                if (len == -1) break;
                os.write(part, 0, len);
            }
            inflater.close();
            os.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(os != null){
                os.close();
            }
        }
        Charset charset = Charset.forName("utf-8");
        return new String(os.toByteArray(), charset);
    }
}
