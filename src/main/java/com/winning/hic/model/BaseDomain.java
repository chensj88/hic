package com.winning.hic.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.winning.hic.model.support.Row;

public abstract class BaseDomain implements Serializable {
    private String queryString;
    private Row row = new Row();

    private Map<String, Object> map = new HashMap<String, Object>();
    private String formLog;

    private String modifiedLog;


    private String deletedLog;

    private String newLog;

    public Map<String, Object> getMap() {
        return this.map;
    }

    public Row getRow() {
        return this.row;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public void setRow(Row row) {
        this.row = row;
    }

    public String getQueryString() {
        return this.queryString;
    }

    public void setQueryString(String queryString) {
        this.queryString = queryString;
    }

    public String getFormLog() {
        return formLog;
    }

    public void setFormLog(String formLog) {
        this.formLog = formLog;
    }

    public String getModifiedLog() {
        return modifiedLog;
    }

    public void setModifiedLog(String modifiedLog) {
        this.modifiedLog = modifiedLog;
    }

    public String getDeletedLog() {
        return deletedLog;
    }

    public void setDeletedLog(String deletedLog) {
        this.deletedLog = deletedLog;
    }

    public String getNewLog() {
        return newLog;
    }

    public void setNewLog(String newLog) {
        this.newLog = newLog;
    }

    private String blnr;

    public String getBlnr() {
        return blnr;
    }

    public void setBlnr(String blnr) {
        this.blnr = blnr;
    }
    private String blmc;

    public String getBlmc() {
        return blmc;
    }

    public void setBlmc(String blmc) {
        this.blmc = blmc;
    }

    private java.sql.Timestamp fssj;

    public Timestamp getFssj() {
        return fssj;
    }

    public void setFssj(Timestamp fssj) {
        this.fssj = fssj;
    }

    private String mxfldm;

    public String getMxfldm() {
        return mxfldm;
    }

    public void setMxfldm(String mxfldm) {
        this.mxfldm = mxfldm;
    }

    public Timestamp cjsj;

    public Timestamp getCjsj() {
        return cjsj;
    }

    public void setCjsj(Timestamp cjsj) {
        this.cjsj = cjsj;
    }
}