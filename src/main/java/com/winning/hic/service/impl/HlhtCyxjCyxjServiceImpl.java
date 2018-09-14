package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtCyxjCyxjDao;
import com.winning.hic.dao.data.HlhtCyxjCyxjDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtCyxjCyxjService;
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


/**
* @author HLHT
* @title HLHT_CYXJ_CYXJ
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:18
*/
@Service
public class HlhtCyxjCyxjServiceImpl implements  HlhtCyxjCyxjService {

    @Autowired
    private HlhtCyxjCyxjDao hlhtCyxjCyxjDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.insertHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public int modifyHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.updateHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public int removeHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.deleteHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public HlhtCyxjCyxj getHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public int getHlhtCyxjCyxjCount(HlhtCyxjCyxj hlhtCyxjCyxj){
        return (Integer)this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxjCount(hlhtCyxjCyxj);
    }

    public List<HlhtCyxjCyxj> getHlhtCyxjCyxjList(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxjList(hlhtCyxjCyxj);
    }

    public List<HlhtCyxjCyxj> getHlhtCyxjCyxjPageList(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxjPageList(hlhtCyxjCyxj);
    }

    private HlhtCyxjCyxj getInitialHlhtCyxjCyxj(HlhtCyxjCyxj entity) {
        return this.hlhtCyxjCyxjDao.selectInitialHlhtCyxjCyxj(entity);

    }

    @Override
    public List<MbzDataCheck> interfaceHlhtCyxjCyxj(MbzDataCheck t) {

        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_CYXJ_CYXJ_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_CYXJ_CYXJ_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_CYXJ_CYXJ_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtCyxjCyxj.class);
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
                        HlhtCyxjCyxj scbcjl = new HlhtCyxjCyxj();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtCyxjCyxj(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtCyxjCyxj oldRcyjl  = new HlhtCyxjCyxj();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtCyxjCyxj(oldRcyjl);
                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_CYXJ_CYXJ_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }
                        HlhtCyxjCyxj entity = new HlhtCyxjCyxj();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtCyxjCyxj(entity);
                        System.out.println("EMR="+Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtCyxjCyxj) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                            //初步诊断-中医病名代码、名称处理
                            if(!"NA".equals(entity.getRzzybmdm())){
                                String bmdm="";
                                String bm="";
                                String[] str=entity.getRzzybmdm().split("  ");
                                String[] str2=entity.getRzzybm().split("  ");
                                Character o=new Character('B');
                                for (int i=0;str.length>i;i++){
                                    if(o.equals(str[i].charAt(0))){
                                        bmdm = bmdm+str[i]+" ";
                                        bm = bm+str2[i]+" ";
                                    }
                                }
                                if(StringUtils.isEmpty(bmdm)){
                                    entity.setRzzybmdm("NA");
                                }else{
                                    entity.setRzzybmdm(bmdm);
                                }
                                if(StringUtils.isEmpty(bm)){
                                    entity.setRzzybm("NA");
                                }else{
                                    entity.setRzzybm(bm);
                                }
                            }
                            //初步诊断-中医证候代码
                            if(!"NA".equals(entity.getRzzyzhdm())){
                                String bmdm="";
                                String bm="";
                                String[] str=entity.getRzzyzhdm().split("  ");
                                String[] str2=entity.getRzzyzh().split("  ");
                                Character o=new Character('B');
                                for (int i=0;str.length>i;i++){
                                    if(!o.equals(str[i].charAt(0))){
                                        bmdm = bmdm+str[i]+" ";
                                        bm = bm+str2[i]+" ";
                                    }
                                }
                                if(StringUtils.isEmpty(bmdm)){
                                    entity.setRzzyzhdm("NA");
                                }else{
                                    entity.setRzzyzhdm(bmdm);
                                }
                                if(StringUtils.isEmpty(bm)){
                                    entity.setRzzyzh("NA");
                                }else{
                                    entity.setRzzyzh(bm);
                                }
                            }

                            //出院诊断-中医病名代码、名称处理
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
                            //出院诊断-中医证候代码
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



                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtCyxjCyxj(entity);
                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_CYXJ_CYXJ_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                entity.getPatid(),entity.getZyh(),entity.getHzxm(),entity.getXbmc(),entity.getXbdm(),
                                entity.getKsmc(),entity.getKsdm(), entity.getBqmc(),entity.getBqdm(), entity.getSfzhm()));

                        real_count++;

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_CYXJ_CYXJ_SOURCE_TYPE));

        return mbzDataChecks;
    }


}