package com.winning.hic.base;

/**
 * 常量类
 * 放置项目需要的常量信息
 */
public class Constants {
    /**
     * 数据库驱动
     */
    public static final String DRIVE_CLASS_NAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    /**
     * jdbc URL前缀
     */
    public static final String URL_PREFIX = "jdbc:sqlserver://";
    /**
     * jdbc 数据库前缀
     */
    public static final String DATABASE_PREFIX = "database";
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
    /**
     * CISDB 接口包名
     */
    public static final String MZ_CISDB_PACKAGE = "com.winning.hic.dao.mz";
    /**
     * CISDB mapper.xml文件的位置
     */
    public static final String MZ_CISDB_MAPPER_LOCATION = "classpath:mapper/mz/*.xml";

    /**
     * this4 接口包名
     */
    public static final String THIS_PACKAGE = "com.winning.hic.dao.his";
    /**
     * this4 mapper.xml文件的位置
     */
    public static final String THIS_MAPPER_LOCATION = "classpath:mapper/his/*.xml";

    /**
     * 平台 接口包名
     */
    public static final String PLATFORM_PACKAGE = "com.winning.hic.dao.platform";
    /**
     * 平台 mapper.xml文件的位置
     */
    public static final String PLATFORM_LOCATION = "classpath:mapper/platform/*.xml";

    /**
     * 数据集数据源常量
     */
    public static final String WN_RYJL_RCYJL_SOURCE_TYPE = "1";//24小时内入出院记录
    public static final String WN_RYJL_RYSWJL_SOURCE_TYPE = "2";//24小时内入院死亡记录
    public static final String WN_ZQGZXX_BWZTZS_SOURCE_TYPE = "3";//病危病重通知书
    public static final String WN_ZYBCJL_CYJL_SOURCE_TYPE = "4";//出院记录
    public static final String WN_RYJL_JBXX_SOURCE_TYPE = "5";//入院记录
    public static final String WN_ZYBCJL_SCBCJL_SOURCE_TYPE = "6";//首次病程记录
    public static final String WN_ZYBCJL_RCBCJL_SOURCE_TYPE = "7";//日常病程记录
    public static final String WN_ZYBCJL_JJBJL_SOURCE_TYPE = "8";//交（接）班记录
    public static final String WN_ZYBCJL_JDXJ_SOURCE_TYPE = "9";//阶段小结
    public static final String WN_ZYBCJL_QJJL_SOURCE_TYPE = "10";//抢救记录
    public static final String WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE = "11";//术后首次病程记录
    public static final String WN_ZYBCJL_SQXJ_SOURCE_TYPE = "12";//术前小结
    public static final String WN_ZYBCJL_SQTL_SOURCE_TYPE = "13";//术前讨论
    public static final String WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE = "14";//死亡病例讨论记录
    public static final String WN_ZYBCJL_SWJL_SOURCE_TYPE = "15";//死亡记录
    public static final String WN_ZLCZJL_MZSQFSJL_SOURCE_TYPE = "16";//麻醉术前访视记录
    public static final String WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE = "17";//麻醉术后访视记录
    public static final String WN_ZQGZXX_MZZQTYS_SOURCE_TYPE = "18";//麻醉知情同意书
    public static final String WN_ZQGZXX_QTZQTYS_SOURCE_TYPE = "19";//其他知情告知同意书
    public static final String WN_ZLCZJL_YBSSJL_SOURCE_TYPE = "20";//手术记录
    public static final String WN_ZYBCJL_HZJL_SOURCE_TYPE = "21";//会诊记录
    public static final String WN_CYXJ_CYXJ_SOURCE_TYPE = "22";//出院小结
    public static final String WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE = "23";//上级医师查房记录
    public static final String WN_ZQGZXX_SSTYS_SOURCE_TYPE = "24";//手术知情同意书
    public static final String WN_ZQGZXX_SXZLTYS_SOURCE_TYPE = "25";//输血（或血液制品）治疗同意书
    public static final String WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE = "26";//疑难病例讨论记录
    public static final String WN_ZYBCJL_ZKJL_SOURCE_TYPE = "27";//转（出）入记录
    public static final String WN_ZZYJL_ZZYJL_SOURCE_TYPE = "28";//转院记录
    public static final String WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE = "29";//特殊检查（治疗）知情同意书
    public static final String WN_ZLCZJL_SXJL_SOURCE_TYPE = "30";//输血病程录
    public static final String WN_MJZBL_MJZBL_SOURCE_TYPE = "31";//门诊病历
    public static final String WN_MJZBL_JZLGBL_SOURCE_TYPE = "32";//急诊留观
    public static final String WN_ZLCZJL_ZLJL_SOURCE_TYPE = "33";//诊疗记录单
    public static final String WN_ZCJL_YDFM_SOURCE_TYPE = "34";//阴道分娩记录单
    public static final String WN_ZCJL_PGC_SOURCE_TYPE = "35";//剖宫产记录单
    public static final String WN_BLGY_JBJKXX_SOURCE_TYPE = "36";//基本健康信息单
    public static final String WN_BLGY_WSSJZY_SOURCE_TYPE = "37";//卫生事件摘要单
    public static final String WN_MJZCF_XYCF_SOURCE_TYPE = "38";//西药处方记录单
    public static final String WN_MJZCF_ZYCF_SOURCE_TYPE = "39";//中药处方记录单



    public static final String SUCCESS = "SUCCESS";
    public static final String ERROR = "error";
}