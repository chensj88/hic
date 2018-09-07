package com.winning.hic.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.winning.hic.model.BaseDomain;



/**
 * @author chensj
 * @title 
 * @email chensj@163.com
 * @package com.winning.hic.model
 * @date 2018-05-23 09:05:13
 */
@Alias("emrMxmcmlk")
public class EmrMxmcmlk extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：MLDM
     * 备注: 
     * 默认值：无
     */
    private String mldm;
    /**
     * 字段名：MLMC
     * 备注: 
     * 默认值：无
     */
    private String mlmc;
    /**
     * 字段名：PY
     * 备注: 
     * 默认值：无
     */
    private String py;
    /**
     * 字段名：WB
     * 备注: 
     * 默认值：无
     */
    private String wb;
    /**
     * 字段名：SJDM
     * 备注: 
     * 默认值：('')
     */
    private String sjdm;
    /**
     * 字段名：MLCC
     * 备注: 
     * 默认值：无
     */
    private Integer mlcc;
    /**
     * 字段名：YXJL
     * 备注: 
     * 默认值：无
     */
    private Short yxjl;
    /**
     * 字段名：MEMO
     * 备注: 
     * 默认值：无
     */
    private String memo;

    public EmrMxmcmlk (){

    }

   /**
   * 字段名：MLDM
   * get方法
   * 备注: 
   */
   public String getMldm(){

        return mldm;
   }

   /**
   * 字段名：MLDM
   * set方法
   * 备注: 
   */
   public void setMldm(String mldm){
        this.mldm = mldm;
   }
   /**
   * 字段名：MLMC
   * get方法
   * 备注: 
   */
   public String getMlmc(){

        return mlmc;
   }

   /**
   * 字段名：MLMC
   * set方法
   * 备注: 
   */
   public void setMlmc(String mlmc){
        this.mlmc = mlmc;
   }
   /**
   * 字段名：PY
   * get方法
   * 备注: 
   */
   public String getPy(){

        return py;
   }

   /**
   * 字段名：PY
   * set方法
   * 备注: 
   */
   public void setPy(String py){
        this.py = py;
   }
   /**
   * 字段名：WB
   * get方法
   * 备注: 
   */
   public String getWb(){

        return wb;
   }

   /**
   * 字段名：WB
   * set方法
   * 备注: 
   */
   public void setWb(String wb){
        this.wb = wb;
   }
   /**
   * 字段名：SJDM
   * get方法
   * 备注: 
   */
   public String getSjdm(){

        return sjdm;
   }

   /**
   * 字段名：SJDM
   * set方法
   * 备注: 
   */
   public void setSjdm(String sjdm){
        this.sjdm = sjdm;
   }
   /**
   * 字段名：MLCC
   * get方法
   * 备注: 
   */
   public Integer getMlcc(){

        return mlcc;
   }

   /**
   * 字段名：MLCC
   * set方法
   * 备注: 
   */
   public void setMlcc(Integer mlcc){
        this.mlcc = mlcc;
   }
   /**
   * 字段名：YXJL
   * get方法
   * 备注: 
   */
   public Short getYxjl(){

        return yxjl;
   }

   /**
   * 字段名：YXJL
   * set方法
   * 备注: 
   */
   public void setYxjl(Short yxjl){
        this.yxjl = yxjl;
   }
   /**
   * 字段名：MEMO
   * get方法
   * 备注: 
   */
   public String getMemo(){

        return memo;
   }

   /**
   * 字段名：MEMO
   * set方法
   * 备注: 
   */
   public void setMemo(String memo){
        this.memo = memo;
   }


    public MBNoteTree getMBPNoteTree(){
        MBNoteTree tree = new MBNoteTree();
        tree.setNodeId(mldm);
        tree.setNodePid("-1");
        tree.setNodeName(mlmc);
        tree.setNodeDesc(mlmc);
        tree.setParent(Integer.parseInt(getMap().get("num").toString()) == 0 ? false : true);
        if(mldm.startsWith("B") && (Integer.parseInt(getMap().get("num").toString()) == 0)){
            tree.setHidden(true);
        }
        if(Integer.parseInt(getMap().get("num").toString()) == 0 ){
            tree.setIcon("glyphicon glyphicon-leaf");
        }else{
            tree.setIconClose("glyphicon glyphicon-chevron-right");
            tree.setIconOpen("glyphicon glyphicon-chevron-down");
        }

        return tree;
    }
   public MBNoteTree getMBNoteTree(){
       MBNoteTree tree = new MBNoteTree();
       tree.setNodeId(mldm);
       tree.setNodePid(mldm.substring(0,mldm.length()-2));
       tree.setNodeName(mlmc);
       tree.setNodeDesc(mlmc);
       tree.setParent(Integer.parseInt(getMap().get("num").toString()) == 0 ? false : true);
       if(mldm.startsWith("B") && (Integer.parseInt(getMap().get("num").toString()) == 0)){
           tree.setHidden(true);
       }
       if(Integer.parseInt(getMap().get("num").toString()) == 0 ){
           tree.setIcon("glyphicon glyphicon-leaf");
       }else{
           tree.setIconClose("glyphicon glyphicon-chevron-right");
           tree.setIconOpen("glyphicon glyphicon-chevron-down");
       }

       return tree;
   }

}