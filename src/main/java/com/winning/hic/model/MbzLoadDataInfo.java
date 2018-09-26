package com.winning.hic.model;

import java.io.Serializable;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.winning.hic.model.BaseDomain;


/**
 * @author HLHT
 * @title 【抽取数据明细数据】
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-24-10 15:24:35
 */
@Alias("mbzLoadDataInfo")
public class MbzLoadDataInfo extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: ID
     * 默认值：无
     */
    private Long id;
    /**
     * 字段名：SOURCE_TYPE
     * 备注: 对应于字典表platformTableName的数据
     * 默认值：无
     */
    private Long sourceType;
    /**
     * 字段名：SOURCE_ID
     * 备注: 来源于字典表,源数据类型
     * 默认值：无
     */
    private Long sourceId;
    /**
     * 字段名：RECORD_NAME
     * 备注: 病历名称
     * 默认值：无
     */
    private String recordName;
    /**
     * 字段名：SYXH
     * 备注: 首页序号
     * 默认值：无
     */
    private String syxh;
    /**
     * 字段名：PATID
     * 备注: PATID
     * 默认值：无
     */
    private String patid;
    /**
     * 字段名：ZYH
     * 备注: 住院号
     * 默认值：无
     */
    private String zyh;
    /**
     * 字段名：HZXM
     * 备注: 姓名
     * 默认值：无
     */
    private String hzxm;
    /**
     * 字段名：XBMC
     * 备注: 性别
     * 默认值：无
     */
    private String xbmc;
    /**
     * 字段名：XBDM
     * 备注:
     * 默认值：无
     */
    private String xbdm;
    /**
     * 字段名：KSMC
     * 备注: 科室
     * 默认值：无
     */
    private String ksmc;
    /**
     * 字段名：KSDM
     * 备注: 科室代码
     * 默认值：无
     */
    private String ksdm;
    /**
     * 字段名：BQMC
     * 备注: 病区
     * 默认值：无
     */
    private String bqmc;
    /**
     * 字段名：BQDM
     * 备注: 病区代码
     * 默认值：无
     */
    private String bqdm;
    /**
     * 字段名：SFZHM
     * 备注: 身份证
     * 默认值：无
     */
    private String sfzhm;
    /**
     * 字段名：FSSJ
     * 备注: 数据发生时间
     * 默认值：无
     */
    private java.sql.Timestamp fssj;
    /**
     * 字段名：CQRQ
     * 备注: 抽取时间
     * 默认值：(getdate())
     */
    private java.sql.Timestamp cqrq;
    /**
     * 必填项符合率
     */
    private Integer percentsBt;
    /**
     * 所有字段符合率
     */
    private Integer percentsAll;

    public MbzLoadDataInfo() {

    }

    public MbzLoadDataInfo(Long sourceType, Long sourceId, String recordName, String syxh, Timestamp fssj, String patid, String zyh, String hzxm, String xbmc, String xbdm, String ksmc, String ksdm, String bqmc, String bqdm, String sfzhm,Integer percentsBt,Integer percentsAll) {
        this.sourceType = sourceType;
        this.sourceId = sourceId;
        this.recordName = recordName;
        this.syxh = syxh;
        this.fssj = fssj;
        this.patid = patid;
        this.zyh = zyh;
        this.hzxm = hzxm;
        this.xbmc = xbmc;
        this.xbdm = xbdm;
        this.ksmc = ksmc;
        this.ksdm = ksdm;
        this.bqmc = bqmc;
        this.bqdm = bqdm;
        this.sfzhm = sfzhm;
        this.percentsBt = percentsBt;
        this.percentsAll = percentsAll;
    }

    /**
     * 字段名：ID
     * get方法
     * 备注: ID
     */
    public Long getId() {

        return id;
    }

    /**
     * 字段名：ID
     * set方法
     * 备注: ID
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 字段名：SOURCE_TYPE
     * get方法
     * 备注: 对应于字典表platformTableName的数据
     */
    public Long getSourceType() {

        return sourceType;
    }

    /**
     * 字段名：SOURCE_TYPE
     * set方法
     * 备注: 对应于字典表platformTableName的数据
     */
    public void setSourceType(Long sourceType) {
        this.sourceType = sourceType;
    }

    /**
     * 字段名：SOURCE_ID
     * get方法
     * 备注: 来源于字典表,源数据类型
     */
    public Long getSourceId() {

        return sourceId;
    }

    /**
     * 字段名：SOURCE_ID
     * set方法
     * 备注: 来源于字典表,源数据类型
     */
    public void setSourceId(Long sourceId) {
        this.sourceId = sourceId;
    }

    /**
     * 字段名：RECORD_NAME
     * get方法
     * 备注: 病历名称
     */
    public String getRecordName() {

        return recordName;
    }

    /**
     * 字段名：RECORD_NAME
     * set方法
     * 备注: 病历名称
     */
    public void setRecordName(String recordName) {
        this.recordName = recordName;
    }

    /**
     * 字段名：SYXH
     * get方法
     * 备注: 首页序号
     */
    public String getSyxh() {

        return syxh;
    }

    /**
     * 字段名：SYXH
     * set方法
     * 备注: 首页序号
     */
    public void setSyxh(String syxh) {
        this.syxh = syxh;
    }

    /**
     * 字段名：PATID
     * get方法
     * 备注: PATID
     */
    public String getPatid() {

        return patid;
    }

    /**
     * 字段名：PATID
     * set方法
     * 备注: PATID
     */
    public void setPatid(String patid) {
        this.patid = patid;
    }

    /**
     * 字段名：ZYH
     * get方法
     * 备注: 住院号
     */
    public String getZyh() {

        return zyh;
    }

    /**
     * 字段名：ZYH
     * set方法
     * 备注: 住院号
     */
    public void setZyh(String zyh) {
        this.zyh = zyh;
    }

    /**
     * 字段名：HZXM
     * get方法
     * 备注: 姓名
     */
    public String getHzxm() {

        return hzxm;
    }

    /**
     * 字段名：HZXM
     * set方法
     * 备注: 姓名
     */
    public void setHzxm(String hzxm) {
        this.hzxm = hzxm;
    }

    /**
     * 字段名：XBMC
     * get方法
     * 备注: 性别
     */
    public String getXbmc() {

        return xbmc;
    }

    /**
     * 字段名：XBMC
     * set方法
     * 备注: 性别
     */
    public void setXbmc(String xbmc) {
        this.xbmc = xbmc;
    }

    /**
     * 字段名：XBDM
     * get方法
     * 备注:
     */
    public String getXbdm() {

        return xbdm;
    }

    /**
     * 字段名：XBDM
     * set方法
     * 备注:
     */
    public void setXbdm(String xbdm) {
        this.xbdm = xbdm;
    }

    /**
     * 字段名：KSMC
     * get方法
     * 备注: 科室
     */
    public String getKsmc() {

        return ksmc;
    }

    /**
     * 字段名：KSMC
     * set方法
     * 备注: 科室
     */
    public void setKsmc(String ksmc) {
        this.ksmc = ksmc;
    }

    /**
     * 字段名：KSDM
     * get方法
     * 备注: 科室代码
     */
    public String getKsdm() {

        return ksdm;
    }

    /**
     * 字段名：KSDM
     * set方法
     * 备注: 科室代码
     */
    public void setKsdm(String ksdm) {
        this.ksdm = ksdm;
    }

    /**
     * 字段名：BQMC
     * get方法
     * 备注: 病区
     */
    public String getBqmc() {

        return bqmc;
    }

    /**
     * 字段名：BQMC
     * set方法
     * 备注: 病区
     */
    public void setBqmc(String bqmc) {
        this.bqmc = bqmc;
    }

    /**
     * 字段名：BQDM
     * get方法
     * 备注: 病区代码
     */
    public String getBqdm() {

        return bqdm;
    }

    /**
     * 字段名：BQDM
     * set方法
     * 备注: 病区代码
     */
    public void setBqdm(String bqdm) {
        this.bqdm = bqdm;
    }

    /**
     * 字段名：SFZHM
     * get方法
     * 备注: 身份证
     */
    public String getSfzhm() {

        return sfzhm;
    }

    /**
     * 字段名：SFZHM
     * set方法
     * 备注: 身份证
     */
    public void setSfzhm(String sfzhm) {
        this.sfzhm = sfzhm;
    }

    /**
     * 字段名：FSSJ
     * get方法
     * 备注: 数据发生时间
     */
    public java.sql.Timestamp getFssj() {

        return fssj;
    }

    /**
     * 字段名：FSSJ
     * set方法
     * 备注: 数据发生时间
     */
    public void setFssj(java.sql.Timestamp fssj) {
        this.fssj = fssj;
    }

    /**
     * 字段名：CQRQ
     * get方法
     * 备注: 抽取时间
     */
    public java.sql.Timestamp getCqrq() {

        return cqrq;
    }

    /**
     * 字段名：CQRQ
     * set方法
     * 备注: 抽取时间
     */
    public void setCqrq(java.sql.Timestamp cqrq) {
        this.cqrq = cqrq;
    }


    public Integer getPercentsBt() {
        return percentsBt;
    }

    public void setPercentsBt(Integer percentsBt) {
        this.percentsBt = percentsBt;
    }

    public Integer getPercentsAll() {
        return percentsAll;
    }

    public void setPercentsAll(Integer percentsAll) {
        this.percentsAll = percentsAll;
    }
}