package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-11-06 13:11:33
 */
@Alias("emrMbmxk")
public class EmrMbmxk extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：MBDM
     * 备注: 
     * 默认值：无
     */
    private String mbdm;
    /**
     * 字段名：JDREFID
     * 备注: 
     * 默认值：无
     */
    private Integer jdrefid;
    /**
     * 字段名：JDDM
     * 备注: 
     * 默认值：无
     */
    private String jddm;
    /**
     * 字段名：JDLX
     * 备注: 
     * 默认值：无
     */
    private String jdlx;
    /**
     * 字段名：JDNR
     * 备注: 
     * 默认值：无
     */
    private String jdnr;
    /**
     * 字段名：MEMO
     * 备注: 
     * 默认值：无
     */
    private String memo;

    public EmrMbmxk (){

    }

   /**
   * 字段名：MBDM
   * get方法
   * 备注: 
   */
   public String getMbdm(){

        return mbdm;
   }

   /**
   * 字段名：MBDM
   * set方法
   * 备注: 
   */
   public void setMbdm(String mbdm){
        this.mbdm = mbdm;
   }
   /**
   * 字段名：JDREFID
   * get方法
   * 备注: 
   */
   public Integer getJdrefid(){

        return jdrefid;
   }

   /**
   * 字段名：JDREFID
   * set方法
   * 备注: 
   */
   public void setJdrefid(Integer jdrefid){
        this.jdrefid = jdrefid;
   }
   /**
   * 字段名：JDDM
   * get方法
   * 备注: 
   */
   public String getJddm(){

        return jddm;
   }

   /**
   * 字段名：JDDM
   * set方法
   * 备注: 
   */
   public void setJddm(String jddm){
        this.jddm = jddm;
   }
   /**
   * 字段名：JDLX
   * get方法
   * 备注: 
   */
   public String getJdlx(){

        return jdlx;
   }

   /**
   * 字段名：JDLX
   * set方法
   * 备注: 
   */
   public void setJdlx(String jdlx){
        this.jdlx = jdlx;
   }
   /**
   * 字段名：JDNR
   * get方法
   * 备注: 
   */
   public String getJdnr(){

        return jdnr;
   }

   /**
   * 字段名：JDNR
   * set方法
   * 备注: 
   */
   public void setJdnr(String jdnr){
        this.jdnr = jdnr;
   }
   /**
   * 字段名：MEMO
   * get方法
   * 备注: 
   */
   public String getMemo(){

        return memo;
   }

   /**
   * 字段名：MEMO
   * set方法
   * 备注: 
   */
   public void setMemo(String memo){
        this.memo = memo;
   }

}