package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 基础数据配置表
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:52
 */
@Alias("hlhtDataSet")
public class HlhtDataSet extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: 
     * 默认值：无
     */
    private String id;
    /**
     * 字段名：P_ID
     * 备注: 
     * 默认值：无
     */
    private Integer pId;
    /**
     * 字段名：SOURCE_TYPE
     * 备注: 
     * 默认值：无
     */
    private String sourceType;
    /**
     * 字段名：LEVEL
     * 备注: 
     * 默认值：无
     */
    private Integer level;
    /**
     * 字段名：COLUMM_NAME
     * 备注: 
     * 默认值：无
     */
    private String colummName;
    /**
     * 字段名：TYPE
     * 备注: 
     * 默认值：无
     */
    private Integer type;
    /**
     * 字段名：DTJDDM
     * 备注: 
     * 默认值：无
     */
    private String dtjddm;
    /**
     * 字段名：QRMBDM
     * 备注: 
     * 默认值：无
     */
    private String qrmbdm;
    /**
     * 字段名：QRDXDM
     * 备注: 
     * 默认值：无
     */
    private String qrdxdm;
    /**
     * 字段名：YZJDDM
     * 备注: 
     * 默认值：无
     */
    private String yzjddm;
    /**
     * 字段名：BT
     * 备注: 1:选中必填
     * 默认值：无
     */
    private Integer bt;
    /**
     * 字段名：SOURCE_NAME
     * 备注: 
     * 默认值：无
     */
    private String sourceName;

    public HlhtDataSet (){

    }

   /**
   * 字段名：ID
   * get方法
   * 备注: 
   */
   public String getId(){

        return id;
   }

   /**
   * 字段名：ID
   * set方法
   * 备注: 
   */
   public void setId(String id){
        this.id = id;
   }
   /**
   * 字段名：P_ID
   * get方法
   * 备注: 
   */
   public Integer getPId(){

        return pId;
   }

   /**
   * 字段名：P_ID
   * set方法
   * 备注: 
   */
   public void setPId(Integer pId){
        this.pId = pId;
   }
   /**
   * 字段名：SOURCE_TYPE
   * get方法
   * 备注: 
   */
   public String getSourceType(){

        return sourceType;
   }

   /**
   * 字段名：SOURCE_TYPE
   * set方法
   * 备注: 
   */
   public void setSourceType(String sourceType){
        this.sourceType = sourceType;
   }
   /**
   * 字段名：LEVEL
   * get方法
   * 备注: 
   */
   public Integer getLevel(){

        return level;
   }

   /**
   * 字段名：LEVEL
   * set方法
   * 备注: 
   */
   public void setLevel(Integer level){
        this.level = level;
   }
   /**
   * 字段名：COLUMM_NAME
   * get方法
   * 备注: 
   */
   public String getColummName(){

        return colummName;
   }

   /**
   * 字段名：COLUMM_NAME
   * set方法
   * 备注: 
   */
   public void setColummName(String colummName){
        this.colummName = colummName;
   }
   /**
   * 字段名：TYPE
   * get方法
   * 备注: 
   */
   public Integer getType(){

        return type;
   }

   /**
   * 字段名：TYPE
   * set方法
   * 备注: 
   */
   public void setType(Integer type){
        this.type = type;
   }
   /**
   * 字段名：DTJDDM
   * get方法
   * 备注: 
   */
   public String getDtjddm(){

        return dtjddm;
   }

   /**
   * 字段名：DTJDDM
   * set方法
   * 备注: 
   */
   public void setDtjddm(String dtjddm){
        this.dtjddm = dtjddm;
   }
   /**
   * 字段名：QRMBDM
   * get方法
   * 备注: 
   */
   public String getQrmbdm(){

        return qrmbdm;
   }

   /**
   * 字段名：QRMBDM
   * set方法
   * 备注: 
   */
   public void setQrmbdm(String qrmbdm){
        this.qrmbdm = qrmbdm;
   }
   /**
   * 字段名：QRDXDM
   * get方法
   * 备注: 
   */
   public String getQrdxdm(){

        return qrdxdm;
   }

   /**
   * 字段名：QRDXDM
   * set方法
   * 备注: 
   */
   public void setQrdxdm(String qrdxdm){
        this.qrdxdm = qrdxdm;
   }
   /**
   * 字段名：YZJDDM
   * get方法
   * 备注: 
   */
   public String getYzjddm(){

        return yzjddm;
   }

   /**
   * 字段名：YZJDDM
   * set方法
   * 备注: 
   */
   public void setYzjddm(String yzjddm){
        this.yzjddm = yzjddm;
   }
   /**
   * 字段名：BT
   * get方法
   * 备注: 1:选中必填
   */
   public Integer getBt(){

        return bt;
   }

   /**
   * 字段名：BT
   * set方法
   * 备注: 1:选中必填
   */
   public void setBt(Integer bt){
        this.bt = bt;
   }
   /**
   * 字段名：SOURCE_NAME
   * get方法
   * 备注: 
   */
   public String getSourceName(){

        return sourceName;
   }

   /**
   * 字段名：SOURCE_NAME
   * set方法
   * 备注: 
   */
   public void setSourceName(String sourceName){
        this.sourceName = sourceName;
   }

}