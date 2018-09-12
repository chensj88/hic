package com.winning.hic.service.impl;

import com.alibaba.druid.sql.visitor.functions.Char;
import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlScbcjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlScbcjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SCBCJL
* @email Chen Kuai
* @package com.winning.hic.service.impl
* @date 2018-8-1 16:34:02
*/
@Service
public class HlhtZybcjlScbcjlServiceImpl implements  HlhtZybcjlScbcjlService {

    @Autowired
    private HlhtZybcjlScbcjlDao hlhtZybcjlScbcjlDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.insertHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public int modifyHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.updateHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public int removeHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.deleteHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public HlhtZybcjlScbcjl getHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public int getHlhtZybcjlScbcjlCount(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return (Integer)this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjlCount(hlhtZybcjlScbcjl);
    }

    public List<HlhtZybcjlScbcjl> getHlhtZybcjlScbcjlList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjlList(hlhtZybcjlScbcjl);
    }

    public List<HlhtZybcjlScbcjl> getHlhtZybcjlScbcjlPageList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjlPageList(hlhtZybcjlScbcjl);
    }

    public HlhtZybcjlScbcjl selectInitialHlhtZybcjlScbcjl(HlhtZybcjlScbcjl t) {
        return this.hlhtZybcjlScbcjlDao.selectInitialHlhtZybcjlScbcjl(t);
    }

    @Override
    public MbzDataCheck interfaceHlhtZybcjlScbcjl(MbzDataCheck t){

        //执行过程信息记录
        MbzDataCheck mbzDataCheck = new MbzDataCheck();
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SCBCJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SCBCJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_SCBCJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlScbcjl.class);
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                qtbljlk.setYxjl(1);
                qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
                qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                emr_count = emr_count+qtbljlkList.size();

                if(qtbljlkList != null){
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        HlhtZybcjlScbcjl scbcjl = new HlhtZybcjlScbcjl();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZybcjlScbcjl(scbcjl);
                        if(scbcjl != null ){
                            //初始化数据
                            HlhtZybcjlScbcjl oldRcyjl  = new HlhtZybcjlScbcjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZybcjlScbcjl(oldRcyjl);
                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SCBCJL_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }
                        HlhtZybcjlScbcjl entity = new HlhtZybcjlScbcjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.selectInitialHlhtZybcjlScbcjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZybcjlScbcjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                            //初步诊断-中医病名代码、名称处理
                            if(!"NA".equals(entity.getCzzybmdm())){
                                String bmdm="";
                                String bm="";
                                String[] str=entity.getCzzybmdm().split("  ");
                                String[] str2=entity.getCzzybm().split("  ");
                                Character o=new Character('B');
                                for (int i=0;str.length>i;i++){
                                    if(o.equals(str[i].charAt(0))){
                                        bmdm = bmdm+str[i]+" ";
                                        bm = bm+str2[i]+" ";
                                    }
                                }
                                if(StringUtils.isEmpty(bmdm)){
                                    entity.setCzzybmdm("NA");
                                }else{
                                    entity.setCzzybmdm(bmdm);
                                }
                                if(StringUtils.isEmpty(bm)){
                                    entity.setCzzybm("NA");
                                }else{
                                    entity.setCzzybm(bm);
                                }
                                }
                            //初步诊断-中医证候代码
                            if(!"NA".equals(entity.getCzzyzhdm())){
                                String bmdm="";
                                String bm="";
                                String[] str=entity.getCzzyzhdm().split("  ");
                                String[] str2=entity.getCzzyzh().split("  ");
                                Character o=new Character('B');
                                for (int i=0;str.length>i;i++){
                                    if(!o.equals(str[i].charAt(0))){
                                        bmdm = bmdm+str[i]+" ";
                                        bm = bm+str2[i]+" ";
                                    }
                                }
                                if(StringUtils.isEmpty(bmdm)){
                                    entity.setCzzyzhdm("NA");
                                }else{
                                    entity.setCzzyzhdm(bmdm);
                                }
                                if(StringUtils.isEmpty(bm)){
                                    entity.setCzzyzh("NA");
                                }else{
                                    entity.setCzzyzh(bm);
                                }
                            }
                            //鉴别诊断-西医诊断编码
                            if(!"NA".equals(entity.getJzxyzdbm())){
                                String xybmdm="";//西医编码
                                String xybm="";//西医名称
                                String zybmdm="";//中医编码
                                String zybm="";//中医名称
                                String zhbmdm="";//中医症候编码
                                String zhbm="";//中医症候名称
                                String[] str=entity.getJzzybmdm().split(",");
                                String[] str2=entity.getJzzybmmc().split("、");
                                //区分西医、中医
                                for (int i=0;str.length>i;i++){
                                    if(str[i].contains(".")){ //西医
                                        xybmdm= xybmdm + str[i]+" ";
                                        xybm = xybm + str2[i]+" ";
                                    }else{
                                        Character o=new Character('B');//病
                                        if(o.equals(str[i].charAt(0))){
                                            zybmdm =zybmdm +str[i] +" ";             //存入病
                                            zybm =zybm + str2[i]+" ";                //存入病
                                        }else{
                                            zhbmdm = zhbmdm +str[i]+" ";             //症候
                                            zhbm =zhbm + str2[i]+" ";
                                        }
                                    }
                                }
                                //鉴别诊断-西医病名编码、名称
                                if(StringUtils.isEmpty(xybmdm)){
                                    entity.setJzxyzdbm("NA");
                                }else{
                                    entity.setJzxyzdbm(xybmdm);
                                }
                                if(StringUtils.isEmpty(xybm)){
                                    entity.setJzxyzdmc("NA");
                                }else{
                                    entity.setJzxyzdmc(xybm);
                                }
                                //鉴别诊断-中医病名编码、名称
                                if(StringUtils.isEmpty(zybmdm)){
                                    entity.setJzzybmdm("NA");
                                }else{
                                    entity.setJzzybmdm(zybmdm);
                                }
                                if(StringUtils.isEmpty(zybm)){
                                    entity.setJzzybmmc("NA");
                                }else{
                                    entity.setJzzybmmc(zybm);
                                }
                                //鉴别诊断-中医症候编码、名称
                                if(StringUtils.isEmpty(zhbmdm)){
                                    entity.setJzzyzhbm("NA");
                                }else{
                                    entity.setJzzyzhbm(zhbmdm);
                                }
                                if(StringUtils.isEmpty(zhbm)){
                                    entity.setJzzyzhmc("NA");
                                }else{
                                    entity.setJzzyzhmc(zhbm);
                                }



                            }


//                            //鉴别诊断-中医病名编码、名称
//                            if(!"NA".equals(entity.getJzzybmdm())){
//                                String bmdm="";
//                                String bm="";
//                                String[] str=entity.getJzzybmdm().split(",");
//                                String[] str2=entity.getJzzybmmc().split("、");
//                                Character o=new Character('B');
//                                for (int i=0;str.length>i;i++){
//                                    if(o.equals(str[i].charAt(0))){
//                                        bmdm = bmdm+str[i]+" ";
//                                        bm = bm+str2[i]+" ";
//                                    }
//                                }
//                                if(StringUtils.isEmpty(bmdm)){
//                                    entity.setJzzybmdm("NA");
//                                }else{
//                                    entity.setJzzybmdm(bmdm);
//                                }
//                                if(StringUtils.isEmpty(bm)){
//                                    entity.setJzzybmmc("NA");
//                                }else{
//                                    entity.setJzzybmmc(bm);
//                                }
//                            }
//                            //鉴别诊断-中医证候编码、名称
//                            if(!"NA".equals(entity.getJzzyzhbm())){
//                                String bmdm="";
//                                String bm="";
//                                String[] str=entity.getJzzyzhbm().split(",");
//                                String[] str2=entity.getJzzyzhmc().split("、");
//                                Character o=new Character('B');
//                                for (int i=0;str.length>i;i++){
//                                    if(!o.equals(str[i].charAt(0))){
//                                        bmdm = bmdm+str[i]+" ";
//                                        bm = bm+str2[i]+" ";
//                                    }
//                                }
//                                if(StringUtils.isEmpty(bmdm)){
//                                    entity.setJzzyzhbm("NA");
//                                }else{
//                                    entity.setJzzyzhbm(bmdm);
//                                }
//                                if(StringUtils.isEmpty(bm)){
//                                    entity.setJzzyzhmc("NA");
//                                }else{
//                                    entity.setJzzyzhmc(bm);
//                                }
//                            }

                            //插入日志
                            mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                    Long.parseLong(Constants.WN_ZYBCJL_SCBCJL_SOURCE_TYPE),
                                    emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                    new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                    entity.getPatid(),entity.getZyh(),entity.getHzxm(),entity.getXbmc(),entity.getXbdm(),
                                    entity.getKsmc(),entity.getKsdm(), entity.getBqmc(),entity.getBqdm(), entity.getSfzhm()));
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }

                        this.createHlhtZybcjlScbcjl(entity);
                        real_count++;
                    }
                }

            }
            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SCBCJL_SOURCE_TYPE));
        }catch (Exception e){
            e.printStackTrace();
        }


        return mbzDataCheck;
    }

    public static void main(String[] args) {
        String ss ="E56.901";
        boolean isContain =ss.contains(".");

        String pattern ="\\w{3,}\\.\\+";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(ss);

        boolean isMatch = r.matcher(ss).matches();
        System.out.println("isMatch="+ isMatch );
        System.out.println("isContain="+ isContain );

    }

    @Override
    public void selectAllHandleQuery() {
        this.hlhtZybcjlScbcjlDao.selectAllHandleQuery();
    }
}