package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 【自动抽取配置】
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-08-13 13:08:52
 */
@Alias("mbzAutomateSet")
public class MbzAutomateSet extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: 
     * 默认值：无
     */
    private String id;
    /**
     * 字段名：JOB_NAME
     * 备注: 任务名称 默认值  HLHT-DATA-EXTRA
     * 默认值：('HLHT-DATA-EXTRA')
     */
    private String jobName;
    /**
     * 字段名：GROUP_NAME
     * 备注: 组名称 默认值  HLHT
     * 默认值：('HLHT')
     */
    private String groupName;
    /**
     * 字段名：TRIGGER_NAME
     * 备注: 触发器名称 默认值 HLHT-TRIGGER
     * 默认值：('HLHT-TRIGGER')
     */
    private String triggerName;
    /**
     * 字段名：BATCH_DATE
     * 备注: 跑批时间
     * 默认值：无
     */
    private String batchDate;
    /**
     * 字段名：CRON
     * 备注: 定时表达式
     * 默认值：无
     */
    private String cron;

    public MbzAutomateSet (){

    }

   /**
   * 字段名：ID
   * get方法
   * 备注: 
   */
   public String getId(){

        return id;
   }

   /**
   * 字段名：ID
   * set方法
   * 备注: 
   */
   public void setId(String id){
        this.id = id;
   }
   /**
   * 字段名：JOB_NAME
   * get方法
   * 备注: 任务名称 默认值  HLHT-DATA-EXTRA
   */
   public String getJobName(){

        return jobName;
   }

   /**
   * 字段名：JOB_NAME
   * set方法
   * 备注: 任务名称 默认值  HLHT-DATA-EXTRA
   */
   public void setJobName(String jobName){
        this.jobName = jobName;
   }
   /**
   * 字段名：GROUP_NAME
   * get方法
   * 备注: 组名称 默认值  HLHT
   */
   public String getGroupName(){

        return groupName;
   }

   /**
   * 字段名：GROUP_NAME
   * set方法
   * 备注: 组名称 默认值  HLHT
   */
   public void setGroupName(String groupName){
        this.groupName = groupName;
   }
   /**
   * 字段名：TRIGGER_NAME
   * get方法
   * 备注: 触发器名称 默认值 HLHT-TRIGGER
   */
   public String getTriggerName(){

        return triggerName;
   }

   /**
   * 字段名：TRIGGER_NAME
   * set方法
   * 备注: 触发器名称 默认值 HLHT-TRIGGER
   */
   public void setTriggerName(String triggerName){
        this.triggerName = triggerName;
   }
   /**
   * 字段名：BATCH_DATE
   * get方法
   * 备注: 跑批时间
   */
   public String getBatchDate(){

        return batchDate;
   }

   /**
   * 字段名：BATCH_DATE
   * set方法
   * 备注: 跑批时间
   */
   public void setBatchDate(String batchDate){
        this.batchDate = batchDate;
   }
   /**
   * 字段名：CRON
   * get方法
   * 备注: 定时表达式
   */
   public String getCron(){

        return cron;
   }

   /**
   * 字段名：CRON
   * set方法
   * 备注: 定时表达式
   */
   public void setCron(String cron){
        this.cron = cron;
   }

}