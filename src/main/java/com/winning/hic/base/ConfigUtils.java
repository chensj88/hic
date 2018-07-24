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
        environment.setDb1Url(properties.getProperty("cisdb.url"));
        environment.setDb1Password(properties.getProperty("cisdb.password"));
        environment.setDb1Username(properties.getProperty("cisdb.username"));
        environment.setDb2Url(properties.getProperty("cisdb.data.url"));
        environment.setDb2Password(properties.getProperty("cisdb.data.password"));
        environment.setDb2Username(properties.getProperty("cisdb.data.username"));
    }

    public Environment getEnvironment(){
        return  environment;
    }
}
