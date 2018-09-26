package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 【基础字段信息】
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-14-08 16:14:22
 */
@Alias("mbzDataColumn")
public class MbzDataColumn extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: ID
     * 默认值：无
     */
    private Long id;
    /**
     * 字段名：TABLE_NAME
     * 备注: 表名
     * 默认值：无
     */
    private String tableName;
    /**
     * 字段名：SOURCE_TYPE
     * 备注: 来源于字典表,源数据类型
     * 默认值：无
     */
    private Long sourceType;
    /**
     * 字段名：RECORD_NAME
     * 备注: 记录名称
     * 默认值：无
     */
    private String recordName;
    /**
     * 字段名：PY_CODE
     * 备注: 拼音码
     * 默认值：无
     */
    private String pyCode;
    /**
     * 是否必填
     *  0 否
     *  1 是
     */
    private Integer bt;

    public MbzDataColumn (){

    }

   /**
   * 字段名：ID
   * get方法
   * 备注: ID
   */
   public Long getId(){

        return id;
   }

   /**
   * 字段名：ID
   * set方法
   * 备注: ID
   */
   public void setId(Long id){
        this.id = id;
   }
   /**
   * 字段名：TABLE_NAME
   * get方法
   * 备注: 表名
   */
   public String getTableName(){

        return tableName;
   }

   /**
   * 字段名：TABLE_NAME
   * set方法
   * 备注: 表名
   */
   public void setTableName(String tableName){
        this.tableName = tableName;
   }
   /**
   * 字段名：SOURCE_TYPE
   * get方法
   * 备注: 来源于字典表,源数据类型
   */
   public Long getSourceType(){

        return sourceType;
   }

   /**
   * 字段名：SOURCE_TYPE
   * set方法
   * 备注: 来源于字典表,源数据类型
   */
   public void setSourceType(Long sourceType){
        this.sourceType = sourceType;
   }
   /**
   * 字段名：RECORD_NAME
   * get方法
   * 备注: 记录名称
   */
   public String getRecordName(){

        return recordName;
   }

   /**
   * 字段名：RECORD_NAME
   * set方法
   * 备注: 记录名称
   */
   public void setRecordName(String recordName){
        this.recordName = recordName;
   }
   /**
   * 字段名：PY_CODE
   * get方法
   * 备注: 拼音码
   */
   public String getPyCode(){

        return pyCode;
   }

   /**
   * 字段名：PY_CODE
   * set方法
   * 备注: 拼音码
   */
   public void setPyCode(String pyCode){
        this.pyCode = pyCode;
   }

    public Integer getBt() {
        return bt;
    }

    public void setBt(Integer bt) {
        this.bt = bt;
    }
}