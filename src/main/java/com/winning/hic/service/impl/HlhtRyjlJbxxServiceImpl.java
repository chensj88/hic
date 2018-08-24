package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.controller.RyjlJbxxExtractController;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtRyjlJbxxDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtRyjlJbxxService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_RYJL_JBXX
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-30-31 16:30:20
 */
@Service
public class HlhtRyjlJbxxServiceImpl implements HlhtRyjlJbxxService {
    private final Logger logger = LoggerFactory.getLogger(HlhtRyjlJbxxServiceImpl.class);
    @Autowired
    private HlhtRyjlJbxxDao hlhtRyjlJbxxDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int modifyHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.updateHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int removeHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public HlhtRyjlJbxx getHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int getHlhtRyjlJbxxCount(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return (Integer) this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxCount(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxList(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxList(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxPageList(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxPageList(hlhtRyjlJbxx);
    }

    @Override
    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxListFromBaseData(EmrQtbljlk emrQtbljlk) {
        return this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData(emrQtbljlk);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtRyjlJbxx(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_RYJL_JBXX_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_RYJL_JBXX_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_RYJL_JBXX_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
            //2.根据模板代码去找到对应的病人病历
            List<HlhtRyjlJbxx> hlhtRyjlJbxxListFromBaseData = this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData(qtbljlk);
            emr_count = emr_count+hlhtRyjlJbxxListFromBaseData.size();

            if (hlhtRyjlJbxxListFromBaseData != null) {
                for (HlhtRyjlJbxx hlhtRyjlJbxx : hlhtRyjlJbxxListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtRyjlJbxx.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtRyjlJbxx temp = new HlhtRyjlJbxx();
                    temp.setYjlxh(hlhtRyjlJbxx.getYjlxh());
                    this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxxByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlJbxx.class);
                    try {
                        hlhtRyjlJbxx = (HlhtRyjlJbxx) HicHelper.initModelValue(mbzDataSetList, document, hlhtRyjlJbxx, paramTypeMap);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    logger.info("Model:{}", hlhtRyjlJbxx);
                    this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);
                    real_count++;
                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_RYJL_JBXX_SOURCE_TYPE));

        return mbzDataChecks;
    }

    @Override
    public void deleteHlhtRyjlJbxxByYjlxh(HlhtRyjlJbxx hlhtRyjlJbxx) {
        this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxxByYjlxh(hlhtRyjlJbxx);
    }
}