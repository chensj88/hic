package com.winning.hic.model;

import java.util.Date; 
import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-23-25 12:23:54
 */
@Alias("hlhtLog")
public class HlhtLog extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：ID
     * 备注: 
     * 默认值：无
     */
    private String id;
    /**
     * 字段名：CONTENT
     * 备注: 操作内容
     * 默认值：无
     */
    private String content;
    /**
     * 字段名：OPERATOR_TIME
     * 备注: 操作时间
     * 默认值：无
     */
    private Date operatorTime;

    public HlhtLog (){

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
   * 字段名：CONTENT
   * get方法
   * 备注: 操作内容
   */
   public String getContent(){

        return content;
   }

   /**
   * 字段名：CONTENT
   * set方法
   * 备注: 操作内容
   */
   public void setContent(String content){
        this.content = content;
   }
   /**
   * 字段名：OPERATOR_TIME
   * get方法
   * 备注: 操作时间
   */
   public Date getOperatorTime(){

        return operatorTime;
   }

   /**
   * 字段名：OPERATOR_TIME
   * set方法
   * 备注: 操作时间
   */
   public void setOperatorTime(Date operatorTime){
        this.operatorTime = operatorTime;
   }

}