package com.winning.hic.base.utils;

import com.winning.hic.model.HlhtRyjlJbxx;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
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
        String getMethodName = "get" + methodName.substring(3);
//        System.out.println("getMethodName:"+getMethodName);
        Method getMethod = objectClass.getDeclaredMethod(getMethodName);
        Object value = getMethod.invoke(object);
        if (value != null) {
            if ((value instanceof String) && !"NA".equals(value)) {
                return;
            }
            if (value instanceof Date) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(((Date) value).getTime());
                int year = calendar.get(Calendar.YEAR);
                if (year != 1990) {
                    return;
                }
            }
            if ((value instanceof Short) && ((Short) value).intValue() != 0) {
                return;
            }
            if (value instanceof Timestamp) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(((Timestamp) value).getTime());
                int year = calendar.get(Calendar.YEAR);
                if (year != 1990) {
                    return;
                }
            }
            if (value instanceof BigDecimal && (((BigDecimal) value).intValue() != 0)) {
                return;
            }
            if (value instanceof Integer && (((Integer) value).intValue() != 0)) {
                return;
            }
        }
        Method setMethod = objectClass.getDeclaredMethod(methodName, paramClass);//得到方法对象,有参的方法需要指定参数类型
        setMethod.invoke(object, param);
    }

    /**
     * Chen,Kuai
     * 2018年8月30日09:11:28
     * 用于累加查找的数据
     * @param object
     * @param methodName
     * @param param
     * @throws Exception
     */
    public static void setParamKind(Object object, String methodName, Object param) throws Exception {
        Class<?> objectClass = object.getClass();
        Class<?> paramClass = param.getClass();
        Method setMethod = objectClass.getDeclaredMethod(methodName, paramClass);//得到方法对象,有参的方法需要指定参数类型
        setMethod.invoke(object, param);
    }

    /**
     *
     * @param object
     * @param methodName
     * @throws Exception
     */
    public static Object getParam(Object object, String methodName) throws Exception {
        Class<?> objectClass = object.getClass();
        Method getMethod = objectClass.getDeclaredMethod(methodName);
        Object value = getMethod.invoke(object);
        return value;
    }

    public static Map<String, String> getParamTypeMap(Class<?> objectClass) {
        Map<String, String> map = new HashMap();
        // 获取实体类的所有属性信息，返回Field数组
        Field[] fields = objectClass.getDeclaredFields();
        for (Field field : fields) {
            //System.out.println(field.getName() + ":" + field.getGenericType().toString());
            map.put(field.getName(), field.getGenericType().toString());
        }
        return map;
    }

    public static void main(String[] args) throws Exception {
        HlhtRyjlJbxx mbzLog = new HlhtRyjlJbxx();
//        java.util.Date dd=new java.util.Date();
//        Date date=new Date(dd.getTime() );
//        String pattern = "yyyy-MM-dd HH:mm:ss";
//        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
//        String dateStr = "1990-01-01 00:00:00";
//        java.sql.Date sqlDate = new java.sql.Date(sdf.parse(dateStr).getTime());
//        mbzLog.setBzrq(date);
//        java.sql.Timestamp date=new java.sql.Timestamp(new java.util.Date().getTime() );
//        String pattern = "yyyy-MM-dd HH:mm:ss";
//        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
//        String dateStr = "1990-01-01 00:00:00";
//        java.sql.Timestamp sqlDate = new java.sql.Timestamp(sdf.parse(dateStr).getTime());
//         mbzLog.setGxsj(sqlDate);
//        Short value = new Short("0");
//        Short num = new Short("72");
//        mbzLog.setTjml(value);
//        mbzLog.setTjsg();
//        mbzLog.setYxjl();
//        String method = "setTjml";
//        ReflectUtil.setParam(mbzLog, method, num);
//        System.out.println(mbzLog.getTjml());
    }


}
