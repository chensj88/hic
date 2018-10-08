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
        //住院医生站
        environment.setCisdbUrl(properties.getProperty("cisdb.url"));
        environment.setCisdbName(properties.getProperty("cisdb.dbName"));
        environment.setCisdbUsername(properties.getProperty("cisdb.username"));
        environment.setCisdbPassword(properties.getProperty("cisdb.password"));
        //门诊医生站
        environment.setMzCisdbUrl(properties.getProperty("cisdb.mz.url"));
        environment.setMzCisdbName(properties.getProperty("cisdb.mz.dbName"));
        environment.setMzCisdbUsername(properties.getProperty("cisdb.mz.username"));
        environment.setMzCisdbPassword(properties.getProperty("cisdb.mz.password"));
        //EMR接口
        environment.setCisdbDataUrl(properties.getProperty("cisdb.data.url"));
        environment.setCisdbDataName(properties.getProperty("cisdb.data.dbName"));
        environment.setCisdbDataPassword(properties.getProperty("cisdb.data.password"));
        environment.setCisdbDataUsername(properties.getProperty("cisdb.data.username"));
        //HIS库  配置链接服务器 住院
       // environment.setHisdbZyLinkserverName(properties.getProperty("hisdb.zy.linkserver.name"));
       // environment.setHisdbZyLinkserverDbName(properties.getProperty("hisdb.zy.linkserver.dbname"));
        //HIS库  配置链接服务器 门诊
       // environment.setHisdbMzLinkserverName(properties.getProperty("hisdb.mz.linkserver.name"));
       // environment.setHisdbMzLinkserverDbName(properties.getProperty("hisdb.mz.linkserver.dbname"));
       /* //平台
        environment.setPlatformDBUrl(properties.getProperty("platformdb.url"));
        environment.setPlatformDBName(properties.getProperty("platformdb.dbName"));
        environment.setPlatformDBUsername(properties.getProperty("platformdb.username"));
        environment.setPlatformDBPassword(properties.getProperty("platformdb.password"));*/

    }

    public static Environment getEnvironment(){
        return  environment;
    }
}
