package com.winning.hic.mybatis;

import com.alibaba.druid.pool.DruidDataSource;
import com.winning.hic.base.ConfigUtils;
import com.winning.hic.model.Environment;
import org.apache.ibatis.io.VFS;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
 * Description:
 * User: LENOVO
 * Date: 2018-07-25
 * Time: 8:55
 */
@Configuration
@MapperScan(basePackages = CisdbMyBatisConfig.PACKAGE, sqlSessionFactoryRef = "cisdbSqlSessionFactory")
public class CisdbMyBatisConfig {

    // 精确到 cisdb 目录，以便跟其他数据源隔离
    static final String PACKAGE = "com.winning.hic.dao.cisdb";
    static final String MAPPER_LOCATION = "classpath:mapper/cisdb/*.xml";

    private static final Logger logger = LoggerFactory.getLogger(CisdbMyBatisConfig.class);

    @Bean(name = "cisdb")
    public DataSource dataSource() throws SQLException {
        Environment env = ConfigUtils.getEnvironment();
        DruidDataSource datasource = new DruidDataSource();
        datasource.setUrl(env.getCISDBURL());
        datasource.setUsername(env.getCisdbUsername());
        datasource.setPassword(env.getCisdbPassword());
        datasource.setDriverClassName(Environment.DRIVE_CLASS_NAME);
        datasource.setInitialSize(5);
        datasource.setMinIdle(5);
        datasource.setMaxActive(20);
        datasource.setMaxWait(60000);
        datasource.setTimeBetweenEvictionRunsMillis(60000);
        datasource.setMinEvictableIdleTimeMillis(300000);
        datasource.setValidationQuery("SELECT GETDATE()");
        datasource.setTestWhileIdle(true);
        datasource.setTestOnBorrow(false);
        datasource.setTestOnReturn(false);
        datasource.setMaxPoolPreparedStatementPerConnectionSize(20);
        Properties prop = new Properties();
        prop.setProperty("druid.stat.mergeSql","true");
        prop.setProperty("druid.stat.slowSqlMillis","5000");
        datasource.setConnectProperties(prop);
        datasource.setUseGlobalDataSourceStat(true);
        datasource.setName("CISDB");
        try {
            datasource.setFilters("stat,wall,log4j");
        } catch (SQLException e) {
            logger.error("druid configuration initialization filter", e);
        }
        logger.info("cisdb init");
        logger.info(String.valueOf(datasource.getConnection()));
        return datasource;
    }

    @Bean(name = "cisdbTransactionManager")
    public DataSourceTransactionManager cisdbTransactionManager(@Qualifier("cisdb") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "cisdbSqlSessionFactory")
    public SqlSessionFactory cisdbSqlSessionFactory(@Qualifier("cisdb") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        //bean.setTypeAliasesPackage(PACKAGE);
        //xml路径
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(MAPPER_LOCATION));
        bean.setVfs(SpringBootVFS.class);
        return bean.getObject();
    }


}
