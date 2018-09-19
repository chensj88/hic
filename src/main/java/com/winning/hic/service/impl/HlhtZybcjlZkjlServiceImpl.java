package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlZkjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_ZKJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-35-31 16:35:02
*/
@Service
public class HlhtZybcjlZkjlServiceImpl implements  HlhtZybcjlZkjlService {

    @Autowired
    private HlhtZybcjlZkjlDao hlhtZybcjlZkjlDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private CommonQueryDao commonQueryDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.insertHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int modifyHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.updateHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int removeHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.deleteHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public HlhtZybcjlZkjl getHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int getHlhtZybcjlZkjlCount(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return (Integer)this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlCount(hlhtZybcjlZkjl);
    }

    public List<HlhtZybcjlZkjl> getHlhtZybcjlZkjlList(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlList(hlhtZybcjlZkjl);
    }

    public List<HlhtZybcjlZkjl> getHlhtZybcjlZkjlPageList(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlPageList(hlhtZybcjlZkjl);
    }

    private HlhtZybcjlZkjl getInitialHlhtZybcjlZkjl(HlhtZybcjlZkjl entity) {
        return this.hlhtZybcjlZkjlDao.selectInitialHlhtZybcjlZkjl(entity);
    }


    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlZkjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量



        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        List<MbzDataSet> rDataSetList = new ArrayList<>();
        String[] rCode = {"zrrq", "zrksdm", "zrks", "zrysbm", "zrysqm", "zrzljh"};
        List<MbzDataSet> cDataSetList = new ArrayList<>();
        String[] cCode = {};
        List<MbzDataSet> bzDataSetList = new ArrayList<>();
        for (MbzDataSet dataSet : mbzDataSetList) {
            //修正诊断字段配置集合
            for (int i = 0; i < rCode.length; i++) {
                if (rCode[i].equals(dataSet.getPyCode())) {
                    rDataSetList.add(dataSet);
                }else{
                    cDataSetList.add(dataSet);
                }
            }
        }

        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList2(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlZkjl.class);
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
                        if(emrQtbljlk.getMxfldm().equals("B-8405")){ //转出记录
                            HlhtZybcjlZkjl zkjl = new HlhtZybcjlZkjl();
                            zkjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            zkjl = this.getHlhtZybcjlZkjl(zkjl);

                            if(zkjl != null ){
                                //初始化数据
                                HlhtZybcjlZkjl oldRcyjl  = new HlhtZybcjlZkjl();
                                oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                                this.removeHlhtZybcjlZkjl(oldRcyjl);
                                //清除日志
                                Map<String,Object> param = new HashMap<>();
                                param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                                param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
                                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                            }
                            HlhtZybcjlZkjl entity = new HlhtZybcjlZkjl();
                            entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                            entity.getMap().put("hisName", ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());
                            entity = this.commonQueryDao.selectInitialHlhtZybcjlZkjl(entity);
                            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            try {
                                entity = (HlhtZybcjlZkjl) HicHelper.initModelValue(cDataSetList, document, entity, paramTypeMap);
                                entity.setZkjllx("1");
                                entity.setZkjllxmc("转入记录");
                            } catch (ParseException e) {
                                e.printStackTrace();
                            }
                            this.createHlhtZybcjlZkjl(entity);
                            //插入日志
                            mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                    Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE),
                                    emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                    new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                    entity.getPatid(),entity.getZyh(),entity.getHzxm(),entity.getXbmc(),entity.getXbdm(),
                                    entity.getKsmc(),entity.getKsdm(), entity.getBqmc(),entity.getBqdm(), entity.getSfzhm()));

                        }else{ //转入记录
                            //找出对应的转出记录，update它的值
                            String yjlxh = emrQtbljlkDao.selectEmrQtbljlkId(emrQtbljlk.getCjsj());
                            HlhtZybcjlZkjl zkjl = new HlhtZybcjlZkjl();
                            zkjl.setYjlxh(yjlxh);
                            zkjl =this.getHlhtZybcjlZkjl(zkjl);
                            if(zkjl !=null){
                                zkjl.setZrrq(null);
                                zkjl.setZrysbm(null);
                                zkjl.setZrysqm(null);
                                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                                try {
                                    zkjl = (HlhtZybcjlZkjl) HicHelper.initModelValue(rDataSetList, document, zkjl, paramTypeMap);

                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                                this.modifyHlhtZybcjlZkjl(zkjl);
                            }

                        }
                        real_count++;

                    }
                }

            }



        }catch (Exception e){
            e.printStackTrace();
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE));

        return null;
    }



}