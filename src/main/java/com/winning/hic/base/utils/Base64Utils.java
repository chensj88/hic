package com.winning.hic.base.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.codec.binary.Base64;

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
        String blnr = "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";
        String decodeBlnr = unzipEmrXml(blnr);
        System.out.println(decodeBlnr);

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
