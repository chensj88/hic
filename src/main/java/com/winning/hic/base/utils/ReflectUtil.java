package com.winning.hic.base.utils;

import com.winning.hic.model.MbzLog;

import java.lang.reflect.Method;

public class ReflectUtil {

    public static void setParam(Object object, String methodName, Object param) throws Exception {
        Class<?> objectClass = object.getClass();
        Class<?> paramClass = param.getClass();
        Method setMethod = objectClass.getDeclaredMethod(methodName, paramClass);//得到方法对象,有参的方法需要指定参数类型
        setMethod.invoke(object, param);
//        repay2.invoke(userEntity,"小飞",5000);//执行还钱方法，有参传参
    }

    public static void main(String[] args) throws Exception {
        MbzLog mbzLog = new MbzLog();
        String method = "setContent";
        String param = "hello world!";
        ReflectUtil.setParam(mbzLog,method,param);

        System.out.println(mbzLog.getContent());
    }


}
