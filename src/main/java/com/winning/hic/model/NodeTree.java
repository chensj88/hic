package com.winning.hic.model;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-08-14
 * Time: 16:01
 */
public class NodeTree {
    /**
     * 节点ID
     */
    private Long nodeId;
    /**
     * ID值
     */
    private Long id;

    /**
     * 显示文本
     */
    private String text ;

    /**
     * 上级ID
     */
    private Long nodePid ;
    /**
     * 拼音码
     */
    private String pyCode;
    /**
     * 数据源类型
     */
    private String sourceType;

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getNodePid() {
        return nodePid;
    }

    public void setNodePid(Long nodePid) {
        this.nodePid = nodePid;
    }

    public String getPyCode() {
        return pyCode;
    }

    public void setPyCode(String pyCode) {
        this.pyCode = pyCode;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }
}
