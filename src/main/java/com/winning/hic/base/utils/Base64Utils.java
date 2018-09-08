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
        String blnr=
                "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";
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
