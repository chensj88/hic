package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZcjlPgcDao;
import com.winning.hic.dao.data.HlhtZcjlPgcDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZcjlPgcService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZCJL_PGC
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:59
*/
@Service
public class HlhtZcjlPgcServiceImpl implements  HlhtZcjlPgcService {

    @Autowired
    private HlhtZcjlPgcDao hlhtZcjlPgcDao;

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

    public int createHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.insertHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int modifyHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.updateHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int removeHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.deleteHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public HlhtZcjlPgc getHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int getHlhtZcjlPgcCount(HlhtZcjlPgc hlhtZcjlPgc){
        return (Integer)this.hlhtZcjlPgcDao.selectHlhtZcjlPgcCount(hlhtZcjlPgc);
    }

    public List<HlhtZcjlPgc> getHlhtZcjlPgcList(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgcList(hlhtZcjlPgc);
    }

    public List<HlhtZcjlPgc> getHlhtZcjlPgcPageList(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgcPageList(hlhtZcjlPgc);
    }

    private HlhtZcjlPgc getInitialHlhtZcjlPgc(HlhtZcjlPgc entity) {
        return this.hlhtZcjlPgcDao.selectInitialHlhtZcjlPgc(entity);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZcjlPgc(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZCJL_PGC_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZCJL_PGC_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZCJL_PGC_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZcjlPgc.class);
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
                        HlhtZcjlPgc scbcjl = new HlhtZcjlPgc();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZcjlPgc(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtZcjlPgc oldRcyjl  = new HlhtZcjlPgc();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZcjlPgc(oldRcyjl);
                        }
                        HlhtZcjlPgc entity = new HlhtZcjlPgc();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZcjlPgc(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZcjlPgc) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZcjlPgc(entity);
                        real_count++;

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZCJL_PGC_SOURCE_TYPE));

        return null;
    }


}