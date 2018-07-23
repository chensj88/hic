package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author chensj
 * @title 
 * @email chensj@163.com
 * @package com.winning.hic.model
 * @date 2018-05-23 09:05:16
 */
@Alias("emrMbk")
public class EmrMbk extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：MBDM
     * 备注: 
     * 默认值：无
     */
    private String mbdm;
    /**
     * 字段名：MBMC
     * 备注: 
     * 默认值：无
     */
    private String mbmc;
    /**
     * 字段名：MBMS
     * 备注: 
     * 默认值：无
     */
    private String mbms;
    /**
     * 字段名：MBNR
     * 备注: 
     * 默认值：无
     */
    private String mbnr;
    /**
     * 字段名：VERSION
     * 备注: 
     * 默认值：无
     */
    private String version;
    /**
     * 字段名：MXFLDM
     * 备注: 
     * 默认值：无
     */
    private String mxfldm;
    /**
     * 字段名：BZDM
     * 备注: 
     * 默认值：无
     */
    private String bzdm;
    /**
     * 字段名：DYMB
     * 备注: 
     * 默认值：无
     */
    private String dymb;
    /**
     * 字段名：YXJL
     * 备注: 
     * 默认值：无
     */
    private Short yxjl;
    /**
     * 字段名：XGSJ
     * 备注: 
     * 默认值：无
     */
    private String xgsj;
    /**
     * 字段名：GRMBBZ
     * 备注: 
     * 默认值：无
     */
    private Short grmbbz;
    /**
     * 字段名：XSYSZ
     * 备注: 
     * 默认值：无
     */
    private String xsysz;
    /**
     * 字段名：XBBZ
     * 备注: 
     * 默认值：无
     */
    private Short xbbz;

    public EmrMbk (){

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
   * 字段名：MBMC
   * get方法
   * 备注: 
   */
   public String getMbmc(){

        return mbmc;
   }

   /**
   * 字段名：MBMC
   * set方法
   * 备注: 
   */
   public void setMbmc(String mbmc){
        this.mbmc = mbmc;
   }
   /**
   * 字段名：MBMS
   * get方法
   * 备注: 
   */
   public String getMbms(){

        return mbms;
   }

   /**
   * 字段名：MBMS
   * set方法
   * 备注: 
   */
   public void setMbms(String mbms){
        this.mbms = mbms;
   }
   /**
   * 字段名：MBNR
   * get方法
   * 备注: 
   */
   public String getMbnr(){

        return mbnr;
   }

   /**
   * 字段名：MBNR
   * set方法
   * 备注: 
   */
   public void setMbnr(String mbnr){
        this.mbnr = mbnr;
   }
   /**
   * 字段名：VERSION
   * get方法
   * 备注: 
   */
   public String getVersion(){

        return version;
   }

   /**
   * 字段名：VERSION
   * set方法
   * 备注: 
   */
   public void setVersion(String version){
        this.version = version;
   }
   /**
   * 字段名：MXFLDM
   * get方法
   * 备注: 
   */
   public String getMxfldm(){

        return mxfldm;
   }

   /**
   * 字段名：MXFLDM
   * set方法
   * 备注: 
   */
   public void setMxfldm(String mxfldm){
        this.mxfldm = mxfldm;
   }
   /**
   * 字段名：BZDM
   * get方法
   * 备注: 
   */
   public String getBzdm(){

        return bzdm;
   }

   /**
   * 字段名：BZDM
   * set方法
   * 备注: 
   */
   public void setBzdm(String bzdm){
        this.bzdm = bzdm;
   }
   /**
   * 字段名：DYMB
   * get方法
   * 备注: 
   */
   public String getDymb(){

        return dymb;
   }

   /**
   * 字段名：DYMB
   * set方法
   * 备注: 
   */
   public void setDymb(String dymb){
        this.dymb = dymb;
   }
   /**
   * 字段名：YXJL
   * get方法
   * 备注: 
   */
   public Short getYxjl(){

        return yxjl;
   }

   /**
   * 字段名：YXJL
   * set方法
   * 备注: 
   */
   public void setYxjl(Short yxjl){
        this.yxjl = yxjl;
   }
   /**
   * 字段名：XGSJ
   * get方法
   * 备注: 
   */
   public String getXgsj(){

        return xgsj;
   }

   /**
   * 字段名：XGSJ
   * set方法
   * 备注: 
   */
   public void setXgsj(String xgsj){
        this.xgsj = xgsj;
   }
   /**
   * 字段名：GRMBBZ
   * get方法
   * 备注: 
   */
   public Short getGrmbbz(){

        return grmbbz;
   }

   /**
   * 字段名：GRMBBZ
   * set方法
   * 备注: 
   */
   public void setGrmbbz(Short grmbbz){
        this.grmbbz = grmbbz;
   }
   /**
   * 字段名：XSYSZ
   * get方法
   * 备注: 
   */
   public String getXsysz(){

        return xsysz;
   }

   /**
   * 字段名：XSYSZ
   * set方法
   * 备注: 
   */
   public void setXsysz(String xsysz){
        this.xsysz = xsysz;
   }
   /**
   * 字段名：XBBZ
   * get方法
   * 备注: 
   */
   public Short getXbbz(){

        return xbbz;
   }

   /**
   * 字段名：XBBZ
   * set方法
   * 备注: 
   */
   public void setXbbz(Short xbbz){
        this.xbbz = xbbz;
   }

}