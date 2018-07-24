package com.winning.hic.model;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-24 13:30:23
 */
 
@Alias("hlhtModelCheck")
public class HlhtModelCheck extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private String id;
	
	private String pId;
	
	private Integer level;
	
	private String qrmbdm;
	
	private String colummName;
	
	private Integer type;
	
	private String dtjddm;
	
	private String qrdxdm;
	
	private String yzjddm;
	
	private String errorDesc;
	
	private Integer status;
	
	public HlhtModelCheck() {

	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPId() {
		return pId;
	}
	
	public void setPId(String pId) {
		this.pId = pId;
	}
	
	public Integer getLevel() {
		return level;
	}
	
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	public String getQrmbdm() {
		return qrmbdm;
	}
	
	public void setQrmbdm(String qrmbdm) {
		this.qrmbdm = qrmbdm;
	}
	
	public String getColummName() {
		return colummName;
	}
	
	public void setColummName(String colummName) {
		this.colummName = colummName;
	}
	
	public Integer getType() {
		return type;
	}
	
	public void setType(Integer type) {
		this.type = type;
	}
	
	public String getDtjddm() {
		return dtjddm;
	}
	
	public void setDtjddm(String dtjddm) {
		this.dtjddm = dtjddm;
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
	
	public String getErrorDesc() {
		return errorDesc;
	}
	
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}
	
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}