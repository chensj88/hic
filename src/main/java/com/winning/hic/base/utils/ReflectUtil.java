package com.winning.hic.base.utils;

import com.winning.hic.model.HlhtRyjlJbxx;
import com.winning.hic.model.MbzLog;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class ReflectUtil {

    /**
     * 根据方法名将参数封装到对象中
     *
     * @param object
     * @param methodName
     * @param param
     * @throws Exception
     */
    public static void setParam(Object object, String methodName, Object param) throws Exception {
        Class<?> objectClass = object.getClass();
        Class<?> paramClass = param.getClass();
        Method setMethod = objectClass.getDeclaredMethod(methodName, paramClass);//得到方法对象,有参的方法需要指定参数类型
        setMethod.invoke(object, param);
    }

    public static Map<String, String> getParamTypeMap(Class<?> objectClass) {
        Map<String, String> map = new HashMap();
        // 获取实体类的所有属性信息，返回Field数组
        Field[] fields = objectClass.getDeclaredFields();
        for (Field field : fields) {
            System.out.println(field.getName() + ":" + field.getGenericType().toString());
            map.put(field.getName(), field.getGenericType().toString());
        }
        return map;
    }

    public static void main(String[] args) throws Exception {
        MbzLog mbzLog = new MbzLog();
        String method = "setContent";
        String param = "hello world!";
        ReflectUtil.setParam(mbzLog, method, param);
        Object obj = new HlhtRyjlJbxx();
        getParamTypeMap(obj.getClass());
        System.out.println(mbzLog.getContent());
    }


}
