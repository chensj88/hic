package com.winning.hic.base.utils;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class JniBase64Convert {

    public static String unzipEmrXml(String blnr){
        ActiveXComponent dotnetCom1 = null;
        String decodeEmrXml = null;
        try {
            dotnetCom1 = new ActiveXComponent("Wining.Emr.Hlht.Hic.Base64Utils.ConvertUtils");
            Variant var = Dispatch.call(dotnetCom1, "UnzipEmrXml",blnr);
            decodeEmrXml = var.toString(); //返回值
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if(dotnetCom1 != null) {
                dotnetCom1.safeRelease();
            }
        }
        return decodeEmrXml;
    }

    public static String zipEmrXml(String blnr){
        ActiveXComponent dotnetCom1 = null;
        String encodeEmrXml = null;
        try {
            dotnetCom1 = new ActiveXComponent("Wining.Emr.Hlht.Hic.Base64Utils.ConvertUtils");
            Variant var = Dispatch.call(dotnetCom1, "ZipEmrXml",blnr);
            encodeEmrXml = var.toString(); //返回值
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if(dotnetCom1 != null) {
                dotnetCom1.safeRelease();
            }
        }
        return encodeEmrXml;
    }


     public static void main(String[] args){
         JniBase64Convert convert = new JniBase64Convert();
         System.out.println(convert.zipEmrXml("abcd"));
         String blnr = "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";
         System.out.println(convert.unzipEmrXml(blnr));
      }
}
