package com.winning.hic.model;

import org.dom4j.Element;

import java.io.Serializable;

/**
 * @author chensj
 * @title
 * @email chensj@winning.com.cn
 * @package com.winning.hic.model
 * @date: 2018-10-08 13:39
 */
public class MbzTemplateNodeDetailInfo extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;
    /**
     * 字段名：id
     */
    private String id;
    /**
     * 字段名：模板代码
     */
    private String mbdm;
    /**
     * 字段名：模板代码
     */
    private String mbmc;
    /**
     * 字段名：节点名称
     */
    private String jdmc;
    /**
     * 字段名：节点类型
     */
    private String jdlx;
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
     * 字段名：SOURCE_TYPE
     * 备注: 来源于字段表,源数据类型
     * 默认值：无
     */
    private String sourceType;


    private Element element;

    public String getMbdm() {
        return mbdm;
    }

    public void setMbdm(String mbdm) {
        this.mbdm = mbdm;
    }

    public String getJdmc() {
        return jdmc;
    }

    public void setJdmc(String jdmc) {
        this.jdmc = jdmc;
    }

    public String getDtjddm() {
        return dtjddm;
    }

    public void setDtjddm(String dtjddm) {
        this.dtjddm = dtjddm;
    }

    public String getQrmbdm() {
        return qrmbdm;
    }

    public void setQrmbdm(String qrmbdm) {
        this.qrmbdm = qrmbdm;
    }

    public String getQrdxdm() {
        return qrdxdm;
    }

    public void setQrdxdm(String qrdxdm) {
        this.qrdxdm = qrdxdm;
    }

    public String getYzjddm() {
        return yzjddm;
    }

    public void setYzjddm(String yzjddm) {
        this.yzjddm = yzjddm;
    }

    public Element getElement() {
        return element;
    }

    public void setElement(Element element) {
        this.element = element;
    }

    public String getJdlx() {
        return jdlx;
    }

    public void setJdlx(String jdlx) {
        this.jdlx = jdlx;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public String getMbmc() {
        return mbmc;
    }

    public void setMbmc(String mbmc) {
        this.mbmc = mbmc;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj==null){
            return false;
        }
        if(this==obj){
            return true;
        }
        if(obj instanceof MbzTemplateNodeDetailInfo){
            MbzTemplateNodeDetailInfo info=(MbzTemplateNodeDetailInfo)obj;
            if(info.jdmc.equals(this.jdmc) &&
               info.jdlx.equals(this.jdlx) ){
                return true;
            }else{
                return false;
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "XmlObjectInfo{" +
                "mbdm='" + mbdm + '\'' +
                ", jdmc='" + jdmc + '\'' +
                ", jdlx='" + jdlx + '\'' +
                ", dtjddm='" + dtjddm + '\'' +
                ", qrmbdm='" + qrmbdm + '\'' +
                ", qrdxdm='" + qrdxdm + '\'' +
                ", yzjddm='" + yzjddm + '\'' +
                '}'+"\n";
    }
}
