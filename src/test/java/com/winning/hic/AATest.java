package com.winning.hic;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-09-05
 * Time: 16:20
 */
public class AATest {

    public static void main(String[] args){
       String str = "11.医嘱离院02.转入病房03.转院04.非医嘱离院05.死亡06.其他";
        Map<String,String> strMap = new HashMap<>();
            while (str.indexOf(".") != -1){
                String key = str.substring(0,str.indexOf("."));
                String temp  = str.substring(str.indexOf(".")+1);
                String value = "";
                if(str.indexOf(".") == str.lastIndexOf(".")){
                    value = temp;
                    str = "";
                }else{
                    value = temp.substring(0,temp.indexOf(".")-2);
                    str = temp.substring(temp.indexOf(".")-2);
                }
                strMap.put(key,value);

            }

        System.out.println(strMap);


    }

}
