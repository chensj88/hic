package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtCyxjCyxjDao;
import com.winning.hic.dao.data.HlhtCyxjCyxjDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtCyxjCyxjService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
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
    public List<MbzDataCheck> interfaceHlhtCyxjCyxj() {

        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtCyxjCyxj.class);
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);

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
                        }
                        HlhtCyxjCyxj entity = new HlhtCyxjCyxj();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtCyxjCyxj(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtCyxjCyxj) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtCyxjCyxj(entity);

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }




        return mbzDataChecks;
    }


}