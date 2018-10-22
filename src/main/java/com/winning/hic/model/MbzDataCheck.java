package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-34-17 13:34:32
 */
@Alias("mbzDataCheck")
public class MbzDataCheck extends BaseDomain implements Serializable {

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
     * 字段名：DATA_COUNT
     * 备注: 
     * 默认值：无
     */
    private Integer dataCount;
    /**
     * 字段名：REAL_COUNT
     * 备注: 
     * 默认值：无
     */
    private Integer realCount;
    /**
     * 字段名：ERROR_DESC
     * 备注: 
     * 默认值：无
     */
    private String errorDesc;

    /**
     * 字段名：IS_AUTOMATE
     * 备注:
     * 默认值：1
     */
    private Integer isAutomate;

    public MbzDataCheck (){

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
   * 字段名：REAL_COUNT
   * get方法
   * 备注: 
   */
   public Integer getRealCount(){

        return realCount;
   }

   /**
   * 字段名：REAL_COUNT
   * set方法
   * 备注: 
   */
   public void setRealCount(Integer realCount){
        this.realCount = realCount;
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

    public Integer getIsAutomate() {
        return isAutomate;
    }

    public void setIsAutomate(Integer isAutomate) {
        this.isAutomate = isAutomate;
    }

}