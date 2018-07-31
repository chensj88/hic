package com.winning.hic.base.utils;

import java.io.UnsupportedEncodingException;

/**
 * Created with IntelliJ IDEA.
 * Description: CISDB 病历内容转换工具
 * User: LENOVO
 * Date: 2018-07-31
 * Time: 9:17
 */
public class CISDBBLNRConvertUtil {

    static {
        System.loadLibrary("Winning.Hic.Base64UtilsWrapper");
    }

    /***
     * EMR 病历内容加密
     * @param emrContent
     * @return
     */
    public native String encoderEmrContent(String emrContent);

    /**
     * EMR 病历内容解密
     * @param emrContent
     * @return
     */
    public native String decoderEmrContent(String emrContent);

     public static void main(String[] args) throws UnsupportedEncodingException {
         CISDBBLNRConvertUtil util = new CISDBBLNRConvertUtil();
         String encodeString = util.encoderEmrContent("hello");
         System.out.println(encodeString);
         System.out.println(util.decoderEmrContent(encodeString));

         String encodeString1 = "bZKxSgNBEIZfZdnKFIc5NSSCZyEYCCiKqPVtdifJwmbvuF016QQVFBWbELExxEIFGy0EQX2bJGcqX8HZC6hFppr5mW//f2CX1iMBikgR0GoJWG1OFLwiFJm3MM+Ft5j3hVf6V5Ro1oSADj6vxjd36fXJqH86vu+O+68zU6SdyvD2/PvjYnj5lHZ646PH9L03eDv8ejj+ujjK5SgRYHgiYysjHdBR9zk9O82Y/68gn3Zepj5BiYWWzdIQ9CaIEeQIggRJDIvH2XaMgbMzKeFMx4nUyGwne0BJNlT0hhCbrA4moGWmDOpCmlixdkB9PwzDfOhTsguJyXIWFopoLK2Cv63QdyuNyMTSMsXRLGG6jr7OEpWo7rSArnhlhKVSGoxxySZyGYsSw5mCpgvaaiqHZj2ykvNIW3CxEdYCu1XNqhjgN/BEXQNdt42A5lEwW7Av4eBvw9SipPk7uoErZkxmxFoJ1NwnQHILFLNQ0cYyzaEyEWeXfwA=";
         String decoderString = util.decoderEmrContent(encodeString1);

         System.out.println( decoderString);
      }

}
