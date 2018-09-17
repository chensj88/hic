package com.winning.hic.mybatis;

import com.alibaba.druid.pool.DruidDataSource;
import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.ConfigUtils;
import com.winning.hic.model.Environment;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * Description: 平台数据库配置
 * User: LENOVO
 * Date: 2018-07-25
 * Time: 8:55
 */
//@Configuration
//@MapperScan(basePackages = Constants.PLATFORM_PACKAGE, sqlSessionFactoryRef = "platformdbSqlSessionFactory")
public class PlatformDBMyBatisConfig {
    // 精确到 data 目录，以便跟其他数据源隔离

//    private static final Logger logger = LoggerFactory.getLogger(PlatformDBMyBatisConfig.class);
//    @Bean(name = "platformdb")
//    public DataSource dataSource() throws SQLException {
//        Environment env = ConfigUtils.getEnvironment();
//        DruidDataSource datasource = new DruidDataSource();
//        datasource.setUrl(env.getPlatformURL());
//        datasource.setUsername(env.getPlatformDBUsername());
//        datasource.setPassword(env.getPlatformDBPassword());
//        datasource.setDriverClassName(Constants.DRIVE_CLASS_NAME);
//        datasource.setInitialSize(5);
//        datasource.setMinIdle(5);
//        datasource.setMaxActive(20);
//        datasource.setMaxWait(60000);
//        datasource.setTimeBetweenEvictionRunsMillis(60000);
//        datasource.setMinEvictableIdleTimeMillis(300000);
//        datasource.setValidationQuery("SELECT GETDATE()");
//        datasource.setTestWhileIdle(true);
//        datasource.setTestOnBorrow(false);
//        datasource.setTestOnReturn(false);
//        datasource.setMaxPoolPreparedStatementPerConnectionSize(20);
//        Properties prop = new Properties();
//        prop.setProperty("druid.stat.mergeSql","true");
//        prop.setProperty("druid.stat.slowSqlMillis","5000");
//        datasource.setConnectProperties(prop);
//        datasource.setUseGlobalDataSourceStat(true);
//        datasource.setName(env.getPlatformDBName());
//        try {
//            datasource.setFilters("stat,wall,log4j");
//        } catch (SQLException e) {
//            logger.error("[{}] druid configuration initialization filter", env.getPlatformDBName(),e);
//        }
//        logger.info("[{}] inited.",env.getPlatformDBName());
//        return datasource;
//    }
//
//    @Bean(name = "platformdbTransactionManager")
//    public DataSourceTransactionManager cisdbDataTransactionManager(@Qualifier("platformdb") DataSource dataSource) {
//        return new DataSourceTransactionManager(dataSource);
//    }
//
//    @Bean(name = "platformdbSqlSessionFactory")
//    public SqlSessionFactory cisdbDataSqlSessionFactory(@Qualifier("platformdb") DataSource dataSource) throws Exception {
//        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
//        bean.setDataSource(dataSource);
//        //bean.setTypeAliasesPackage(PACKAGE);
//        //xml路径
//        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(Constants.PLATFORM_LOCATION));
//        bean.setVfs(SpringBootVFS.class);
//        return bean.getObject();
//    }

}
