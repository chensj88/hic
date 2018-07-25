package com.winning.hic.base;

/**
 * 常量类
 * 放置项目需要的常量信息
 */
public class Constant {
    /**
     * 数据库驱动
     */
    public static final String DRIVE_CLASS_NAME ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    /**
     * jdbc URL前缀
     */
    public static final String URL_PREFIX ="jdbc:sqlserver://";
    /**
     * jdbc 数据库前缀
     */
    public static final String DATABASE_PREFIX ="database";
    /**
     * CISDB_DATA 接口包名
     */
    public static final String CISDB_DATA_PACKAGE = "com.winning.hic.dao.data";
    /**
     * CISDB_DATA mapper.xml文件的位置
     */
    public static final String CISDB_DATA_MAPPER_LOCATION = "classpath:mapper/data/*.xml";
    /**
     * CISDB 接口包名
     */
    public static final String CISDB_PACKAGE = "com.winning.hic.dao.cisdb";
    /**
     * CISDB mapper.xml文件的位置
     */
    public static final String CISDB_MAPPER_LOCATION = "classpath:mapper/cisdb/*.xml";
}