package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:50
 */
@Alias("hlhtDataCheck")
public class HlhtDataCheck extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: 
     * 默认值：无
     */
    private String id;
    /**
     * 字段名：SOURCE_TYPE
     * 备注: 
     * 默认值：无
     */
    private Integer sourceType;
    /**
     * 字段名：P_ID
     * 备注: 
     * 默认值：无
     */
    private String pId;
    /**
     * 字段名：NAME
     * 备注: 
     * 默认值：无
     */
    private String name;
    /**
     * 字段名：DATA_COUNT
     * 备注: 
     * 默认值：无
     */
    private Integer dataCount;
    /**
     * 字段名：ERROR_COLUNM
     * 备注: 
     * 默认值：无
     */
    private String errorColunm;
    /**
     * 字段名：ERROR_DESC
     * 备注: 
     * 默认值：无
     */
    private String errorDesc;

    public HlhtDataCheck (){

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
   * 字段名：SOURCE_TYPE
   * get方法
   * 备注: 
   */
   public Integer getSourceType(){

        return sourceType;
   }

   /**
   * 字段名：SOURCE_TYPE
   * set方法
   * 备注: 
   */
   public void setSourceType(Integer sourceType){
        this.sourceType = sourceType;
   }
   /**
   * 字段名：P_ID
   * get方法
   * 备注: 
   */
   public String getPId(){

        return pId;
   }

   /**
   * 字段名：P_ID
   * set方法
   * 备注: 
   */
   public void setPId(String pId){
        this.pId = pId;
   }
   /**
   * 字段名：NAME
   * get方法
   * 备注: 
   */
   public String getName(){

        return name;
   }

   /**
   * 字段名：NAME
   * set方法
   * 备注: 
   */
   public void setName(String name){
        this.name = name;
   }
   /**
   * 字段名：DATA_COUNT
   * get方法
   * 备注: 
   */
   public Integer getDataCount(){

        return dataCount;
   }

   /**
   * 字段名：DATA_COUNT
   * set方法
   * 备注: 
   */
   public void setDataCount(Integer dataCount){
        this.dataCount = dataCount;
   }
   /**
   * 字段名：ERROR_COLUNM
   * get方法
   * 备注: 
   */
   public String getErrorColunm(){

        return errorColunm;
   }

   /**
   * 字段名：ERROR_COLUNM
   * set方法
   * 备注: 
   */
   public void setErrorColunm(String errorColunm){
        this.errorColunm = errorColunm;
   }
   /**
   * 字段名：ERROR_DESC
   * get方法
   * 备注: 
   */
   public String getErrorDesc(){

        return errorDesc;
   }

   /**
   * 字段名：ERROR_DESC
   * set方法
   * 备注: 
   */
   public void setErrorDesc(String errorDesc){
        this.errorDesc = errorDesc;
   }

}