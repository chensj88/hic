package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author MBZ
 * @title 基础数据配置表
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-27-26 15:27:55
 */
@Alias("mbzDataSet")
public class MbzDataSet extends BaseDomain implements Serializable {

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
    /**
     * 字段名：DATA_TYPE
     * 备注: 1 文件结构 2 基础模板 3元数据
     * 默认值：无
     */
    private Integer dataType;
    /**
     * 字段名：DTJDDM
     * 备注: 文件机构ID
     * 默认值：无
     */
    private String dtjddm;
    /**
     * 字段名：QRMBDM
     * 备注: 基础模板ID
     * 默认值：无
     */
    private String qrmbdm;
    /**
     * 字段名：QRDXDM
     * 备注: 元数据ID
     * 默认值：无
     */
    private String qrdxdm;
    /**
     * 字段名：YZJDDM
     * 备注: 原子节点ID
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
     * 是否需要前缀或者后缀
     * 0不需要 1 需要 暂定
     */
    private Long valueFlag;

    /**
     * 字段是否需要配置
     * 主要用于校验
     * 0 不需要 1 需要
     */
    private Integer mustMatch ;

    public MbzDataSet(){

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
   /**
   * 字段名：DATA_TYPE
   * get方法
   * 备注: 1 文件结构 2 基础模板 3元数据
   */
   public Integer getDataType(){

        return dataType;
   }

   /**
   * 字段名：DATA_TYPE
   * set方法
   * 备注: 1 文件结构 2 基础模板 3元数据
   */
   public void setDataType(Integer dataType){
        this.dataType = dataType;
   }
   /**
   * 字段名：DTJDDM
   * get方法
   * 备注: 文件机构ID
   */
   public String getDtjddm(){

        return dtjddm;
   }

   /**
   * 字段名：DTJDDM
   * set方法
   * 备注: 文件机构ID
   */
   public void setDtjddm(String dtjddm){
        this.dtjddm = dtjddm;
   }
   /**
   * 字段名：QRMBDM
   * get方法
   * 备注: 基础模板ID
   */
   public String getQrmbdm(){

        return qrmbdm;
   }

   /**
   * 字段名：QRMBDM
   * set方法
   * 备注: 基础模板ID
   */
   public void setQrmbdm(String qrmbdm){
        this.qrmbdm = qrmbdm;
   }
   /**
   * 字段名：QRDXDM
   * get方法
   * 备注: 元数据ID
   */
   public String getQrdxdm(){

        return qrdxdm;
   }

   /**
   * 字段名：QRDXDM
   * set方法
   * 备注: 元数据ID
   */
   public void setQrdxdm(String qrdxdm){
        this.qrdxdm = qrdxdm;
   }
   /**
   * 字段名：YZJDDM
   * get方法
   * 备注: 原子节点ID
   */
   public String getYzjddm(){

        return yzjddm;
   }

   /**
   * 字段名：YZJDDM
   * set方法
   * 备注: 原子节点ID
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


    public Long getValueFlag() {
        return valueFlag;
    }

    public void setValueFlag(Long valueFlag) {
        this.valueFlag = valueFlag;
    }

    public Integer getMustMatch() {
        return mustMatch;
    }

    public void setMustMatch(Integer mustMatch) {
        this.mustMatch = mustMatch;
    }
}