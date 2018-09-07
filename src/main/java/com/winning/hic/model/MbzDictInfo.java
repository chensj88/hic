package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author MBZ
 * @title 【字典表】
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:53
 */
@Alias("mbzDictInfo")
public class MbzDictInfo extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：DICT_CODE
     * 备注: 字典编码
     * 默认值：无
     */
    private String dictCode;
    /**
     * 字段名：DICT_VALUE
     * 备注: 字典值
     * 默认值：无
     */
    private String dictValue;
    /**
     * 字段名：DICT_LABEL
     * 备注: 字典名称
     * 默认值：无
     */
    private String dictLabel;
    /**
     * 字段名：DICT_SORT
     * 备注: 字典顺序
     * 默认值：无
     */
    private String dictSort;
    /**
     * 字段名：DICT_DESC
     * 备注: 
     * 默认值：无
     */
    private String dictDesc;
    /**
     * 字段名：PY_CODE
     * 备注: 
     * 默认值：无
     */
    private String pyCode;
    /**
     * 字段名：STATUS
     * 备注: 是否使用 0 否 1 是
     * 默认值：无
     */
    private Integer status;

    public MbzDictInfo (){

    }

   /**
   * 字段名：DICT_CODE
   * get方法
   * 备注: 字典编码
   */
   public String getDictCode(){

        return dictCode;
   }

   /**
   * 字段名：DICT_CODE
   * set方法
   * 备注: 字典编码
   */
   public void setDictCode(String dictCode){
        this.dictCode = dictCode;
   }
   /**
   * 字段名：DICT_VALUE
   * get方法
   * 备注: 字典值
   */
   public String getDictValue(){

        return dictValue;
   }

   /**
   * 字段名：DICT_VALUE
   * set方法
   * 备注: 字典值
   */
   public void setDictValue(String dictValue){
        this.dictValue = dictValue;
   }
   /**
   * 字段名：DICT_LABEL
   * get方法
   * 备注: 字典名称
   */
   public String getDictLabel(){

        return dictLabel;
   }

   /**
   * 字段名：DICT_LABEL
   * set方法
   * 备注: 字典名称
   */
   public void setDictLabel(String dictLabel){
        this.dictLabel = dictLabel;
   }
   /**
   * 字段名：DICT_SORT
   * get方法
   * 备注: 字典顺序
   */
   public String getDictSort(){

        return dictSort;
   }

   /**
   * 字段名：DICT_SORT
   * set方法
   * 备注: 字典顺序
   */
   public void setDictSort(String dictSort){
        this.dictSort = dictSort;
   }
   /**
   * 字段名：DICT_DESC
   * get方法
   * 备注: 
   */
   public String getDictDesc(){

        return dictDesc;
   }

   /**
   * 字段名：DICT_DESC
   * set方法
   * 备注: 
   */
   public void setDictDesc(String dictDesc){
        this.dictDesc = dictDesc;
   }
   /**
   * 字段名：PY_CODE
   * get方法
   * 备注: 
   */
   public String getPyCode(){

        return pyCode;
   }

   /**
   * 字段名：PY_CODE
   * set方法
   * 备注: 
   */
   public void setPyCode(String pyCode){
        this.pyCode = pyCode;
   }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}