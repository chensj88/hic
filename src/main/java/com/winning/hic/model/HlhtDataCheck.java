package com.winning.hic.model;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-24 13:30:22
 */
 
@Alias("hlhtDataCheck")
public class HlhtDataCheck extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private String id;
	
	private Integer sourceType;
	
	private String pId;
	
	private String name;
	
	private Integer dataCount;
	
	private String errorColunm;
	
	private String errorDesc;
	
	public HlhtDataCheck() {

	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public Integer getSourceType() {
		return sourceType;
	}
	
	public void setSourceType(Integer sourceType) {
		this.sourceType = sourceType;
	}
	
	public String getPId() {
		return pId;
	}
	
	public void setPId(String pId) {
		this.pId = pId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getDataCount() {
		return dataCount;
	}
	
	public void setDataCount(Integer dataCount) {
		this.dataCount = dataCount;
	}
	
	public String getErrorColunm() {
		return errorColunm;
	}
	
	public void setErrorColunm(String errorColunm) {
		this.errorColunm = errorColunm;
	}
	
	public String getErrorDesc() {
		return errorDesc;
	}
	
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}
	
}