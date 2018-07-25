package com.winning.hic.base;

import com.winning.hic.model.Environment;

import java.io.*;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * Description:
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
        environment.setCisdbUrl(properties.getProperty("cisdb.url"));
        environment.setCisdbName(properties.getProperty("cisdb.dbName"));
        environment.setCisdbUsername(properties.getProperty("cisdb.username"));
        environment.setCisdbPassword(properties.getProperty("cisdb.password"));
        environment.setCisdbDataUrl(properties.getProperty("cisdb.data.url"));
        environment.setCisdbDataName(properties.getProperty("cisdb.data.dbName"));
        environment.setCisdbDataPassword(properties.getProperty("cisdb.data.password"));
        environment.setCisdbDataUsername(properties.getProperty("cisdb.data.username"));
    }

    public static Environment getEnvironment(){
        return  environment;
    }
}
