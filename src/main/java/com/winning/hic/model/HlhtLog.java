package com.winning.hic.model;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;
import java.util.Date;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-24 13:30:23
 */
 
@Alias("hlhtLog")
public class HlhtLog extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private String id;
	
	private String content;
	
	private Date operatorTime;
	
	public HlhtLog() {

	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getOperatorTime() {
		return operatorTime;
	}
	
	public void setOperatorTime(Date operatorTime) {
		this.operatorTime = operatorTime;
	}
	
}