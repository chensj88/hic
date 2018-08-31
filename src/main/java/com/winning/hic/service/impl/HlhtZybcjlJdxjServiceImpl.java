package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlJdxjDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlJdxjService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_JDXJ
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:32
*/
@Service
public class HlhtZybcjlJdxjServiceImpl implements  HlhtZybcjlJdxjService {

    @Autowired
    private HlhtZybcjlJdxjDao hlhtZybcjlJdxjDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.insertHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int modifyHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.updateHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int removeHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.deleteHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public HlhtZybcjlJdxj getHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int getHlhtZybcjlJdxjCount(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return (Integer)this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjCount(hlhtZybcjlJdxj);
    }

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjList(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjList(hlhtZybcjlJdxj);
    }

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjPageList(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjPageList(hlhtZybcjlJdxj);
    }

    public HlhtZybcjlJdxj getInitialHlhtZybcjlJdxj(HlhtZybcjlJdxj t) {
        return this.hlhtZybcjlJdxjDao.selectInitialHlhtZybcjlJdxj(t);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlJdxj(MbzDataCheck t) {

        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlJdxj.class);
            for(MbzDataListSet dataListSet :dataListSets) {
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                qtbljlk.setYxjl(1);
                qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
                qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                emr_count = emr_count+qtbljlkList.size();

                if (qtbljlkList != null) {
                            for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                                HlhtZybcjlJdxj jdxj = new HlhtZybcjlJdxj();
                                jdxj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                                jdxj =  this.getHlhtZybcjlJdxj(jdxj);
                                if (jdxj != null) {
                                    //初始化数据
                                    HlhtZybcjlJdxj oldRcyjl = new HlhtZybcjlJdxj();
                                    oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                                    this.removeHlhtZybcjlJdxj(oldRcyjl);
                                }
                                HlhtZybcjlJdxj entity = new HlhtZybcjlJdxj();
                                entity.getMap().put("QTBLJLXH", emrQtbljlk.getQtbljlxh());
                                entity = this.getInitialHlhtZybcjlJdxj(entity);
                                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                                try {
                                    entity = (HlhtZybcjlJdxj) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                                this.createHlhtZybcjlJdxj(entity);
                                real_count++;

                            }

                        }

            }
            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE));

        }catch (Exception e){
            e.printStackTrace();
        }


        return mbzDataChecks;
    }

}