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
 
@Alias("hlhtDatabasesList")
public class HlhtDatabasesList extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private Long id;
	
	private String dataAlias;
	
	private String ip;
	
	private String userName;
	
	private String pw;
	
	private String databaseName;
	
	private Date createTime;
	
	public HlhtDatabasesList() {

	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getDataAlias() {
		return dataAlias;
	}
	
	public void setDataAlias(String dataAlias) {
		this.dataAlias = dataAlias;
	}
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getDatabaseName() {
		return databaseName;
	}
	
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}