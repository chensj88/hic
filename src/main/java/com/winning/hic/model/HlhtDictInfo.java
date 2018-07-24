package com.winning.hic.model;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;


/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-24 13:30:23
 */
 
@Alias("hlhtDictInfo")
public class HlhtDictInfo extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private String dictCode;
	
	private String dictValue;
	
	private String dictLabel;
	
	private String dictSort;
	
	private String dictDesc;
	
	private String pyCode;
	
	public HlhtDictInfo() {

	}

	public String getDictCode() {
		return dictCode;
	}
	
	public void setDictCode(String dictCode) {
		this.dictCode = dictCode;
	}
	
	public String getDictValue() {
		return dictValue;
	}
	
	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}
	
	public String getDictLabel() {
		return dictLabel;
	}
	
	public void setDictLabel(String dictLabel) {
		this.dictLabel = dictLabel;
	}
	
	public String getDictSort() {
		return dictSort;
	}
	
	public void setDictSort(String dictSort) {
		this.dictSort = dictSort;
	}
	
	public String getDictDesc() {
		return dictDesc;
	}
	
	public void setDictDesc(String dictDesc) {
		this.dictDesc = dictDesc;
	}
	
	public String getPyCode() {
		return pyCode;
	}
	
	public void setPyCode(String pyCode) {
		this.pyCode = pyCode;
	}
	
}