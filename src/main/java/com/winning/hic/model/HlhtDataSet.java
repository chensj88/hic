package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 基础数据配置表
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-24-26 09:24:07
 */
@Alias("hlhtDataSet")
public class HlhtDataSet extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: ID
     * 默认值：无
     */
    private Long id;
    /**
     * 字段名：P_ID
     * 备注: 父级节点
     * 默认值：无
     */
    private Long pId;
    /**
     * 字段名：SOURCE_TYPE
     * 备注: 来源于字段表,源数据类型
     * 默认值：无
     */
    private String sourceType;
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
     * 字段名：DICT_CODE
     * 备注: 字典码值
     * 默认值：无
     */
    private String dictCode;

    public HlhtDataSet (){

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
   * 字段名：P_ID
   * get方法
   * 备注: 父级节点
   */
   public Long getPId(){

        return pId;
   }

   /**
   * 字段名：P_ID
   * set方法
   * 备注: 父级节点
   */
   public void setPId(Long pId){
        this.pId = pId;
   }
   /**
   * 字段名：SOURCE_TYPE
   * get方法
   * 备注: 来源于字段表,源数据类型
   */
   public String getSourceType(){

        return sourceType;
   }

   /**
   * 字段名：SOURCE_TYPE
   * set方法
   * 备注: 来源于字段表,源数据类型
   */
   public void setSourceType(String sourceType){
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
   /**
   * 字段名：DICT_CODE
   * get方法
   * 备注: 字典码值
   */
   public String getDictCode(){

        return dictCode;
   }

   /**
   * 字段名：DICT_CODE
   * set方法
   * 备注: 字典码值
   */
   public void setDictCode(String dictCode){
        this.dictCode = dictCode;
   }

}