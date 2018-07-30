package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author MBZ
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:50
 */
@Alias("mbzDataListSet")
public class MbzDataListSet extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：SOURCE_TYPE
     * 备注: 
     * 默认值：无
     */
    private String sourceType;
    /**
     * 字段名：MODEL_CODE
     * 备注: 
     * 默认值：无
     */
    private String modelCode;
    /**
     * 字段名：SOURCE_NAME
     * 备注: 
     * 默认值：无
     */
    private String sourceName;
    /**
     * 字段名：MODEL_NAME
     * 备注: 
     * 默认值：无
     */
    private String modelName;

    public MbzDataListSet (){

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
   * 字段名：MODEL_CODE
   * get方法
   * 备注: 
   */
   public String getModelCode(){

        return modelCode;
   }

   /**
   * 字段名：MODEL_CODE
   * set方法
   * 备注: 
   */
   public void setModelCode(String modelCode){
        this.modelCode = modelCode;
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
   /**
   * 字段名：MODEL_NAME
   * get方法
   * 备注: 
   */
   public String getModelName(){

        return modelName;
   }

   /**
   * 字段名：MODEL_NAME
   * set方法
   * 备注: 
   */
   public void setModelName(String modelName){
        this.modelName = modelName;
   }

}