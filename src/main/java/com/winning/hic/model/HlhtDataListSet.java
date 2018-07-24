package com.winning.hic.model;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-24 13:30:22
 */
 
@Alias("hlhtDataListSet")
public class HlhtDataListSet extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private String sourceType;
	
	private String modelCode;
	
	public HlhtDataListSet() {

	}

	public String getSourceType() {
		return sourceType;
	}
	
	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}
	
	public String getModelCode() {
		return modelCode;
	}
	
	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}
	
}