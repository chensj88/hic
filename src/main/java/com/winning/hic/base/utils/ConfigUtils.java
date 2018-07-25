package com.winning.hic.base.utils;

import com.winning.hic.model.Environment;

import java.io.*;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * Description:加载config.properties文件内容，填充内容到Environment中
 * User: LENOVO
 * Date: 2018-07-24
 * Time: 15:30
 */
public class ConfigUtils {

    private static Properties properties = new Properties();
    private static Environment environment = new Environment();

    public static void readProperties(File file) throws IOException {
        InputStream is = new FileInputStream(file);
        properties.load(is);
        is.close();
        initEnvConfig(properties);
    }

    private static void initEnvConfig(Properties properties) {
        //门诊医生站/住院医生站
        environment.setCisdbUrl(properties.getProperty("cisdb.url"));
        environment.setCisdbName(properties.getProperty("cisdb.dbName"));
        environment.setCisdbUsername(properties.getProperty("cisdb.username"));
        environment.setCisdbPassword(properties.getProperty("cisdb.password"));
        //EMR接口
        environment.setCisdbDataUrl(properties.getProperty("cisdb.data.url"));
        environment.setCisdbDataName(properties.getProperty("cisdb.data.dbName"));
        environment.setCisdbDataPassword(properties.getProperty("cisdb.data.password"));
        environment.setCisdbDataUsername(properties.getProperty("cisdb.data.username"));
        //HIS库
        environment.setHisDBUrl(properties.getProperty("hisdb.url"));
        environment.setHisDBName(properties.getProperty("hisdb.dbName"));
        environment.setHisDBUsername(properties.getProperty("hisdb.username"));
        environment.setHisDBPassword(properties.getProperty("hisdb.password"));
        //平台
        environment.setPlatformDBUrl(properties.getProperty("platformdb.url"));
        environment.setPlatformDBName(properties.getProperty("platformdb.dbName"));
        environment.setPlatformDBUsername(properties.getProperty("platformdb.username"));
        environment.setPlatformDBPassword(properties.getProperty("platformdb.password"));
    }

    public static Environment getEnvironment(){
        return  environment;
    }
}
