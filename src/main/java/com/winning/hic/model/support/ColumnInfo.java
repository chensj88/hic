package com.winning.hic.model.support;

/**
 * Created with IntelliJ IDEA.
 * Description: 字段信息，转换数据信息到Bootstrap Table字段信息
 * User: LENOVO
 * Date: 2018-09-10
 * Time: 10:00
 */
public class ColumnInfo {

    private String title;
    private String field;
    private String align;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }
}
