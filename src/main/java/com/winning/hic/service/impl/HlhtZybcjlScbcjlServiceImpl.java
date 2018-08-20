package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.controller.RyjlJbxxExtractController;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlScbcjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlScbcjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


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
    public MbzDataCheck interfaceHlhtZybcjlScbcjl(){

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
                        }
                        HlhtZybcjlScbcjl entity = new HlhtZybcjlScbcjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.selectInitialHlhtZybcjlScbcjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZybcjlScbcjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
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
}