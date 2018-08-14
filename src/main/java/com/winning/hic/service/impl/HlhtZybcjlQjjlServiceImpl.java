package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlQjjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlQjjlService;
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
* @title HLHT_ZYBCJL_QJJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:49
*/
@Service
public class HlhtZybcjlQjjlServiceImpl implements  HlhtZybcjlQjjlService {

    @Autowired
    private HlhtZybcjlQjjlDao hlhtZybcjlQjjlDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    public int createHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.insertHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int modifyHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.updateHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int removeHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.deleteHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public HlhtZybcjlQjjl getHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int getHlhtZybcjlQjjlCount(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return (Integer)this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlCount(hlhtZybcjlQjjl);
    }

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlList(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlList(hlhtZybcjlQjjl);
    }

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlPageList(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlPageList(hlhtZybcjlQjjl);
    }

    public HlhtZybcjlQjjl getInitialHlhtZybcjlQjjl(HlhtZybcjlQjjl t) {
        return this.hlhtZybcjlQjjlDao.selectInitialHlhtZybcjlQjjl(t);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlQjjl() {
//执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlQjjl.class);
            for(MbzDataListSet dataListSet :dataListSets) {
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                if (qtbljlkList != null) {
                    for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                        HlhtZybcjlQjjl qjjl = new HlhtZybcjlQjjl();
                        qjjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        qjjl =  this.getHlhtZybcjlQjjl(qjjl);
                        if (qjjl != null) {
                            //初始化数据
                            HlhtZybcjlQjjl oldRcyjl = new HlhtZybcjlQjjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZybcjlQjjl(oldRcyjl);
                        }
                        HlhtZybcjlQjjl entity = new HlhtZybcjlQjjl();
                        entity.getMap().put("QTBLJLXH", emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZybcjlQjjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZybcjlQjjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZybcjlQjjl(entity);

                    }

                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return mbzDataChecks;
    }
}