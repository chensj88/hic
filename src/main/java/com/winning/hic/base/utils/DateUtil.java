package com.winning.hic.base.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 日期工具类。
 *
 * @author 郭宇航
 */
public final class DateUtil {
    private DateUtil() {
    }

    /**
     * 默认日期格式。
     */
    public static final String DEFAULT_PATTERN = "yyyy-MM-dd";
    /**
     * 8位日期格式。
     */
    public static final String PATTERN_8 = "yyyyMMdd";
    /**
     * 14位日期格式。
     */
    public static final String PATTERN_14 = "yyyyMMddHHmmss";
    /**
     * 17位日期格式。
     */
    public static final String PATTERN_17 = "yyyyMMddHHmmssSSS";
    /**
     * 19位日期格式。
     */
    public static final String PATTERN_19 = "yyyy-MM-dd HH:mm:ss";
    /**
     * 时间格式
     */
    public static final String TIME_8 = "HH:mm:ss";

    private static ThreadLocal<Map<String, DateFormat>> formats = new ThreadLocal<Map<String, DateFormat>>();

    /**
     * 格式化当前日期到默认格式。
     * <p>
     * format : {@value #DEFAULT_PATTERN}
     *
     * @return String
     */
    public static String format() {
        Date date = new Date();
        return format(date);
    }

    /**
     * 格式化当前日期。
     *
     * @param pattern 日期格式
     * @return String
     */
    public static String format(String pattern) {
        Date date = new Date();
        return format(date, pattern);
    }

    /**
     * 格式化日期到默认格式。
     * <p>
     * format : {@value #DEFAULT_PATTERN}
     *
     * @param date Date
     * @return String
     */
    public static String format(Date date) {
        return format(date, DEFAULT_PATTERN);
    }

    /**
     * 格式化日期。
     *
     * @param date    Date
     * @param pattern 日期格式
     * @return String
     */
    public static String format(Date date, String pattern) {
        DateFormat format = getFormat(pattern);
        return format.format(date);
    }

    /**
     * 解析日期字符串。
     *
     * @param date Date
     * @return Date
     * @throws ParseException 日期格式解析异常
     */
    public static Date parse(String date) throws ParseException {
        return parse(date, DEFAULT_PATTERN);
    }

    /**
     * 解析指定格式日期字符串。
     *
     * @param date    Date
     * @param pattern 日期格式
     * @return Date
     * @throws ParseException 日期格式解析异常
     */
    public static Date parse(String date, String pattern) throws ParseException {
        DateFormat format = getFormat(pattern);
        return format.parse(date);
    }

    /**
     * 线程安全地获取Dateformat对象。
     *
     * @param pattern 日期格式
     * @return Dateformat
     */
    private static DateFormat getFormat(String pattern) {
        if (null != formats.get()) {
            Map<String, DateFormat> m = formats.get();
            if (m.containsKey(pattern)) {
                return m.get(pattern);
            } else {
                DateFormat format = new SimpleDateFormat(pattern);
                m.put(pattern, format);
                return format;
            }
        } else {
            Map<String, DateFormat> m = new HashMap<String, DateFormat>();
            DateFormat format = new SimpleDateFormat(pattern);
            m.put(pattern, format);
            formats.set(m);
            return format;
        }
    }

    /**
     * 获取系统当前时间。
     *
     * @return String
     */
    public static String getCrrentTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(new Date());
    }

    /**
     * 获取2个日期之间的天数
     *
     * @param startDate
     * @param endDate
     * @return
     */
    public static int twoDateBetween(Date startDate, Date endDate) {
        int days = (int) ((endDate.getTime() - startDate.getTime()) / (1000 * 3600 * 24));
        return days;
    }

    /**
     * 获取系统当前年份。
     *
     * @return String
     */
    public static String getParticularyear() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy");
        return df.format(new Date());
    }


    public static Timestamp getCurrentTimestamp(){
        return  new Timestamp(new Date().getTime());
    }

    /**
     * 获取系统日期20180101
     * @return
     */
    public static String getCurrentDay(){
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        return df.format(new Date());
    }
    /**
     * 获取系统日期2018-01-01
     * @return
     */
    public static String getCurrentDayByFormatter(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(new Date());
    }

    public static String getTimstamp(){
        return System.currentTimeMillis() +"";
    }

    public static String getYYYYMMDDHHmmSSTimstamp(){
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        return df.format(new Date(System.currentTimeMillis()));
    }

    public static Timestamp convertDateStringToTimestap(String dateString) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return new Timestamp(df.parse(dateString).getTime());
    }

    /**
     * 时间格式转换 2017/08/09 --> 08-09
     * @param dateString
     * @return
     * @throws ParseException
     */
    public static String convertDateToMMDD(String dateString) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        Date date = df.parse(dateString);
        df = new SimpleDateFormat("MM-dd");
        return df.format(date);
    }

    /**
     * 在当前日期增加制定的日期
     * @param num
     * @return
     */
    public static String plusDay(int num){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE,num);
        return df.format(calendar.getTime());
    }


    public static void main(String[] args) {

        String strValue="636467930400000000`2017-11-20,16:44";
        String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
        String pattern="yyyy-MM-dd,HH:mm";
        SimpleDateFormat sdf=new SimpleDateFormat(pattern);
        try {
            Date date = sdf.parse(dateStr);
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
            System.out.println(date);
            System.out.println(sqlDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }


    }
}
