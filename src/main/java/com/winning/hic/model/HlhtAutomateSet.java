package com.winning.hic.model;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-24 13:30:22
 */
 
@Alias("hlhtAutomateSet")
public class HlhtAutomateSet extends BaseDomain implements Serializable {

	private static final long serialVersionUID = -1L;

	private String exceute;
	
	private Integer exceuteDay;
	
	private String dayStartTime;
	
	private Integer exceuteTime;
	
	private String startTime;
	
	private String endTime;
	
	private String projectStartTime;
	
	private String projectEndTime;
	
	private String remark;
	
	private Integer projectStatus;
	
	public HlhtAutomateSet() {

	}

	public String getExceute() {
		return exceute;
	}
	
	public void setExceute(String exceute) {
		this.exceute = exceute;
	}
	
	public Integer getExceuteDay() {
		return exceuteDay;
	}
	
	public void setExceuteDay(Integer exceuteDay) {
		this.exceuteDay = exceuteDay;
	}
	
	public String getDayStartTime() {
		return dayStartTime;
	}
	
	public void setDayStartTime(String dayStartTime) {
		this.dayStartTime = dayStartTime;
	}
	
	public Integer getExceuteTime() {
		return exceuteTime;
	}
	
	public void setExceuteTime(Integer exceuteTime) {
		this.exceuteTime = exceuteTime;
	}
	
	public String getStartTime() {
		return startTime;
	}
	
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getEndTime() {
		return endTime;
	}
	
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getProjectStartTime() {
		return projectStartTime;
	}
	
	public void setProjectStartTime(String projectStartTime) {
		this.projectStartTime = projectStartTime;
	}
	
	public String getProjectEndTime() {
		return projectEndTime;
	}
	
	public void setProjectEndTime(String projectEndTime) {
		this.projectEndTime = projectEndTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getProjectStatus() {
		return projectStatus;
	}
	
	public void setProjectStatus(Integer projectStatus) {
		this.projectStatus = projectStatus;
	}
	
}