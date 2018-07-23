package com.winning.hic.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-23
 * Time: 9:25
 */
public class MBNoteTree {

    private String nodeId;

    private String nodePid;

    private String nodeName;

    private String nodeDesc;

    private boolean IsParent;

    private List<MBNoteTree> children = new ArrayList<>();

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
    }

    public String getNodePid() {
        return nodePid;
    }

    public void setNodePid(String nodePid) {
        this.nodePid = nodePid;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getNodeDesc() {
        return nodeDesc;
    }

    public void setNodeDesc(String nodeDesc) {
        this.nodeDesc = nodeDesc;
    }

    public List<MBNoteTree> getChildren() {
        return children;
    }

    public void setChildren(List<MBNoteTree> children) {
        this.children = children;
    }

    public void addMbNoteTrees(MBNoteTree mbNoteTree) {
        this.children.add(mbNoteTree);
    }

    public boolean isParent() {
        return IsParent;
    }

    public void setParent(boolean parent) {
        IsParent = parent;
    }
}
