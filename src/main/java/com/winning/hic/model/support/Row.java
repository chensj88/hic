package com.winning.hic.model.support;

import java.io.Serializable;

public class Row implements Serializable {
    private static final long serialVersionUID = -2345403372879875867L;
    //上一页结束数据条数
    private Integer first;
    //每页显示数据条数
    private Integer count;
    //排序字段
    private String sort;
    //排序方法 asc desc
    private String order;

    public Row() {
    }

    public Row(Integer first, Integer count) {
        this.first = first;
        this.count = count;
    }

    public Row(Integer first, Integer count, String sort, String order) {
        this.first = first;
        this.count = count;
        this.sort = sort;
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Integer getCount() {
        return this.count;
    }

    public Integer getFirst() {
        return this.first;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public void setFirst(Integer first) {
        this.first = first;
    }
}