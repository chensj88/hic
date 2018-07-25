package com.winning.hic.model;

import com.winning.hic.base.Constant;

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

    public String getCISDBURL(){
        return Constant.URL_PREFIX +cisdbUrl+";"+Constant.DATABASE_PREFIX+"="+cisdbName;
    }

    public String getCISDBDataURL(){
        return Constant.URL_PREFIX+cisdbDataUrl+";"+Constant.DATABASE_PREFIX+"="+cisdbDataName;
    }
}
