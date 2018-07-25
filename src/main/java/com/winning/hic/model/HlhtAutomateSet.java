package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:48
 */
@Alias("hlhtAutomateSet")
public class HlhtAutomateSet extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：EXCEUTE
     * 备注: 
     * 默认值：无
     */
    private String exceute;
    /**
     * 字段名：EXCEUTE_DAY
     * 备注: 
     * 默认值：无
     */
    private Integer exceuteDay;
    /**
     * 字段名：DAY_START_TIME
     * 备注: 
     * 默认值：无
     */
    private String dayStartTime;
    /**
     * 字段名：EXCEUTE_TIME
     * 备注: 
     * 默认值：无
     */
    private Integer exceuteTime;
    /**
     * 字段名：START_TIME
     * 备注: 
     * 默认值：无
     */
    private String startTime;
    /**
     * 字段名：END_TIME
     * 备注: 
     * 默认值：无
     */
    private String endTime;
    /**
     * 字段名：PROJECT_START_TIME
     * 备注: 
     * 默认值：无
     */
    private String projectStartTime;
    /**
     * 字段名：PROJECT_END_TIME
     * 备注: 
     * 默认值：无
     */
    private String projectEndTime;
    /**
     * 字段名：REMARK
     * 备注: 
     * 默认值：无
     */
    private String remark;
    /**
     * 字段名：PROJECT_STATUS
     * 备注: 
     * 默认值：无
     */
    private Integer projectStatus;

    public HlhtAutomateSet (){

    }

   /**
   * 字段名：EXCEUTE
   * get方法
   * 备注: 
   */
   public String getExceute(){

        return exceute;
   }

   /**
   * 字段名：EXCEUTE
   * set方法
   * 备注: 
   */
   public void setExceute(String exceute){
        this.exceute = exceute;
   }
   /**
   * 字段名：EXCEUTE_DAY
   * get方法
   * 备注: 
   */
   public Integer getExceuteDay(){

        return exceuteDay;
   }

   /**
   * 字段名：EXCEUTE_DAY
   * set方法
   * 备注: 
   */
   public void setExceuteDay(Integer exceuteDay){
        this.exceuteDay = exceuteDay;
   }
   /**
   * 字段名：DAY_START_TIME
   * get方法
   * 备注: 
   */
   public String getDayStartTime(){

        return dayStartTime;
   }

   /**
   * 字段名：DAY_START_TIME
   * set方法
   * 备注: 
   */
   public void setDayStartTime(String dayStartTime){
        this.dayStartTime = dayStartTime;
   }
   /**
   * 字段名：EXCEUTE_TIME
   * get方法
   * 备注: 
   */
   public Integer getExceuteTime(){

        return exceuteTime;
   }

   /**
   * 字段名：EXCEUTE_TIME
   * set方法
   * 备注: 
   */
   public void setExceuteTime(Integer exceuteTime){
        this.exceuteTime = exceuteTime;
   }
   /**
   * 字段名：START_TIME
   * get方法
   * 备注: 
   */
   public String getStartTime(){

        return startTime;
   }

   /**
   * 字段名：START_TIME
   * set方法
   * 备注: 
   */
   public void setStartTime(String startTime){
        this.startTime = startTime;
   }
   /**
   * 字段名：END_TIME
   * get方法
   * 备注: 
   */
   public String getEndTime(){

        return endTime;
   }

   /**
   * 字段名：END_TIME
   * set方法
   * 备注: 
   */
   public void setEndTime(String endTime){
        this.endTime = endTime;
   }
   /**
   * 字段名：PROJECT_START_TIME
   * get方法
   * 备注: 
   */
   public String getProjectStartTime(){

        return projectStartTime;
   }

   /**
   * 字段名：PROJECT_START_TIME
   * set方法
   * 备注: 
   */
   public void setProjectStartTime(String projectStartTime){
        this.projectStartTime = projectStartTime;
   }
   /**
   * 字段名：PROJECT_END_TIME
   * get方法
   * 备注: 
   */
   public String getProjectEndTime(){

        return projectEndTime;
   }

   /**
   * 字段名：PROJECT_END_TIME
   * set方法
   * 备注: 
   */
   public void setProjectEndTime(String projectEndTime){
        this.projectEndTime = projectEndTime;
   }
   /**
   * 字段名：REMARK
   * get方法
   * 备注: 
   */
   public String getRemark(){

        return remark;
   }

   /**
   * 字段名：REMARK
   * set方法
   * 备注: 
   */
   public void setRemark(String remark){
        this.remark = remark;
   }
   /**
   * 字段名：PROJECT_STATUS
   * get方法
   * 备注: 
   */
   public Integer getProjectStatus(){

        return projectStatus;
   }

   /**
   * 字段名：PROJECT_STATUS
   * set方法
   * 备注: 
   */
   public void setProjectStatus(Integer projectStatus){
        this.projectStatus = projectStatus;
   }

}