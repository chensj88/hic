package com.winning.hic.model;

import java.util.Date; 
import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author MBZ
 * @title 医院远程数据库连接地址配置信息
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:49
 */
@Alias("mbzDatabasesList")
public class MbzDatabasesList extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: 
     * 默认值：无
     */
    private Long id;
    /**
     * 字段名：DATA_ALIAS
     * 备注: 
     * 默认值：无
     */
    private String dataAlias;
    /**
     * 字段名：IP
     * 备注: 
     * 默认值：无
     */
    private String ip;
    /**
     * 字段名：USER_NAME
     * 备注: 
     * 默认值：无
     */
    private String userName;
    /**
     * 字段名：PW
     * 备注: 
     * 默认值：无
     */
    private String pw;
    /**
     * 字段名：DATABASE_NAME
     * 备注: 
     * 默认值：无
     */
    private String databaseName;
    /**
     * 字段名：CREATE_TIME
     * 备注: 创建时间
     * 默认值：无
     */
    private Date createTime;

    public MbzDatabasesList (){

    }

   /**
   * 字段名：ID
   * get方法
   * 备注: 
   */
   public Long getId(){

        return id;
   }

   /**
   * 字段名：ID
   * set方法
   * 备注: 
   */
   public void setId(Long id){
        this.id = id;
   }
   /**
   * 字段名：DATA_ALIAS
   * get方法
   * 备注: 
   */
   public String getDataAlias(){

        return dataAlias;
   }

   /**
   * 字段名：DATA_ALIAS
   * set方法
   * 备注: 
   */
   public void setDataAlias(String dataAlias){
        this.dataAlias = dataAlias;
   }
   /**
   * 字段名：IP
   * get方法
   * 备注: 
   */
   public String getIp(){

        return ip;
   }

   /**
   * 字段名：IP
   * set方法
   * 备注: 
   */
   public void setIp(String ip){
        this.ip = ip;
   }
   /**
   * 字段名：USER_NAME
   * get方法
   * 备注: 
   */
   public String getUserName(){

        return userName;
   }

   /**
   * 字段名：USER_NAME
   * set方法
   * 备注: 
   */
   public void setUserName(String userName){
        this.userName = userName;
   }
   /**
   * 字段名：PW
   * get方法
   * 备注: 
   */
   public String getPw(){

        return pw;
   }

   /**
   * 字段名：PW
   * set方法
   * 备注: 
   */
   public void setPw(String pw){
        this.pw = pw;
   }
   /**
   * 字段名：DATABASE_NAME
   * get方法
   * 备注: 
   */
   public String getDatabaseName(){

        return databaseName;
   }

   /**
   * 字段名：DATABASE_NAME
   * set方法
   * 备注: 
   */
   public void setDatabaseName(String databaseName){
        this.databaseName = databaseName;
   }
   /**
   * 字段名：CREATE_TIME
   * get方法
   * 备注: 创建时间
   */
   public Date getCreateTime(){

        return createTime;
   }

   /**
   * 字段名：CREATE_TIME
   * set方法
   * 备注: 创建时间
   */
   public void setCreateTime(Date createTime){
        this.createTime = createTime;
   }

}