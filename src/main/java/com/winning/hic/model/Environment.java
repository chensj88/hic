package com.winning.hic.model;

import com.winning.hic.base.Constants;

/**
 * Created with IntelliJ IDEA.
 * Description: 数据库参数信息
 * User: LENOVO
 * Date: 2018-07-24
 * Time: 14:53
 */
public class Environment {


    private String cisdbUrl;
    private String cisdbName;
    private String cisdbUsername;
    private String cisdbPassword;
    private String cisdbDataUrl;
    private String cisdbDataName;
    private String cisdbDataUsername;
    private String cisdbDataPassword;

    private String hisDBUrl;
    private String hisDBName;
    private String hisDBUsername;
    private String hisDBPassword;
    private String platformDBUrl;
    private String platformDBName;
    private String platformDBUsername;
    private String platformDBPassword;

    public String getCisdbUrl() {
        return cisdbUrl;
    }

    public void setCisdbUrl(String cisdbUrl) {
        this.cisdbUrl = cisdbUrl;
    }

    public String getCisdbName() {
        return cisdbName;
    }

    public void setCisdbName(String cisdbName) {
        this.cisdbName = cisdbName;
    }

    public String getCisdbUsername() {
        return cisdbUsername;
    }

    public void setCisdbUsername(String cisdbUsername) {
        this.cisdbUsername = cisdbUsername;
    }

    public String getCisdbPassword() {
        return cisdbPassword;
    }

    public void setCisdbPassword(String cisdbPassword) {
        this.cisdbPassword = cisdbPassword;
    }

    public String getCisdbDataUrl() {
        return cisdbDataUrl;
    }

    public void setCisdbDataUrl(String cisdbDataUrl) {
        this.cisdbDataUrl = cisdbDataUrl;
    }

    public String getCisdbDataName() {
        return cisdbDataName;
    }

    public void setCisdbDataName(String cisdbDataName) {
        this.cisdbDataName = cisdbDataName;
    }

    public String getCisdbDataUsername() {
        return cisdbDataUsername;
    }

    public void setCisdbDataUsername(String cisdbDataUsername) {
        this.cisdbDataUsername = cisdbDataUsername;
    }

    public String getCisdbDataPassword() {
        return cisdbDataPassword;
    }

    public void setCisdbDataPassword(String cisdbDataPassword) {
        this.cisdbDataPassword = cisdbDataPassword;
    }

    public String getHisDBUrl() {
        return hisDBUrl;
    }

    public void setHisDBUrl(String hisDBUrl) {
        this.hisDBUrl = hisDBUrl;
    }

    public String getHisDBName() {
        return hisDBName;
    }

    public void setHisDBName(String hisDBName) {
        this.hisDBName = hisDBName;
    }

    public String getHisDBUsername() {
        return hisDBUsername;
    }

    public void setHisDBUsername(String hisDBUsername) {
        this.hisDBUsername = hisDBUsername;
    }

    public String getHisDBPassword() {
        return hisDBPassword;
    }

    public void setHisDBPassword(String hisPassword) {
        this.hisDBPassword = hisPassword;
    }

    public String getPlatformDBUrl() {
        return platformDBUrl;
    }

    public void setPlatformDBUrl(String platformDBUrl) {
        this.platformDBUrl = platformDBUrl;
    }

    public String getPlatformDBName() {
        return platformDBName;
    }

    public void setPlatformDBName(String platformDBName) {
        this.platformDBName = platformDBName;
    }

    public String getPlatformDBUsername() {
        return platformDBUsername;
    }

    public void setPlatformDBUsername(String platformDBUsername) {
        this.platformDBUsername = platformDBUsername;
    }

    public String getPlatformDBPassword() {
        return platformDBPassword;
    }

    public void setPlatformDBPassword(String platformDBPassword) {
        this.platformDBPassword = platformDBPassword;
    }

    public String getCISDBURL(){
        return Constants.URL_PREFIX +cisdbUrl+";"+Constants.DATABASE_PREFIX+"="+cisdbName;
    }

    public String getCISDBDataURL(){
        return Constants.URL_PREFIX+cisdbDataUrl+";"+Constants.DATABASE_PREFIX+"="+cisdbDataName;
    }

    public String getTHIS4URL(){
        return Constants.URL_PREFIX+hisDBUrl+";"+Constants.DATABASE_PREFIX+"="+hisDBName;
    }

    public String getPlatformURL(){
        return Constants.URL_PREFIX+platformDBUrl+";"+Constants.DATABASE_PREFIX+"="+platformDBName;
    }
}
