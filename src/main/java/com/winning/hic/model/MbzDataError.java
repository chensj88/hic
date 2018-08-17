package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-34-17 13:34:29
 */
@Alias("mbzDataError")
public class MbzDataError extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：SOURCE_TYPE
     * 备注: 
     * 默认值：无
     */
    private Integer sourceType;
    /**
     * 字段名：HZXM
     * 备注: 
     * 默认值：无
     */
    private String hzxm;
    /**
     * 字段名：ERROR_COLUMN
     * 备注: 
     * 默认值：无
     */
    private String errorColumn;
    /**
     * 字段名：ERROR_DESC
     * 备注: 
     * 默认值：无
     */
    private String errorDesc;

    public MbzDataError (){

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
   * 字段名：HZXM
   * get方法
   * 备注: 
   */
   public String getHzxm(){

        return hzxm;
   }

   /**
   * 字段名：HZXM
   * set方法
   * 备注: 
   */
   public void setHzxm(String hzxm){
        this.hzxm = hzxm;
   }
   /**
   * 字段名：ERROR_COLUMN
   * get方法
   * 备注: 
   */
   public String getErrorColumn(){

        return errorColumn;
   }

   /**
   * 字段名：ERROR_COLUMN
   * set方法
   * 备注: 
   */
   public void setErrorColumn(String errorColumn){
        this.errorColumn = errorColumn;
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