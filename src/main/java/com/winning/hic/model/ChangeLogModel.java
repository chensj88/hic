package com.winning.hic.model;

import java.lang.reflect.Method;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-27
 * Time: 12:50
 */
public class ChangeLogModel {

    private String field;
    private String oldValue;
    private String className;

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getChangeLog() throws ClassNotFoundException {
        Class clazz = Class.forName(this.getClassName());
        String methodName = "get" + this.field.substring(0,1).toUpperCase() + this.field.substring(1);

        return methodName;


    }
}
