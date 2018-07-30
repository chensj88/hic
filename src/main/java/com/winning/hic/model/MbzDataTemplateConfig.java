package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author MBZ
 * @title 【模板字段配置】
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-24-26 09:24:06
 */
@Alias("mbzDataTemplateConfig")
public class MbzDataTemplateConfig extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: ID
     * 默认值：无
     */
    private Long id;
    /**
     * 字段名：SOURCE_ID
     * 备注: MBZ_DATA_SET.ID
     * 默认值：无
     */
    private Long sourceId;
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

    public MbzDataTemplateConfig (){

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
   * 字段名：SOURCE_ID
   * get方法
   * 备注: MBZ_DATA_SET.ID
   */
   public Long getSourceId(){

        return sourceId;
   }

   /**
   * 字段名：SOURCE_ID
   * set方法
   * 备注: MBZ_DATA_SET.ID
   */
   public void setSourceId(Long sourceId){
        this.sourceId = sourceId;
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

}