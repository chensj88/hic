package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZlczjlZljlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZlczjlZljlService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_ZLCZJL_ZLJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-32-31 16:32:09
 */
@Service
public class HlhtZlczjlZljlServiceImpl implements HlhtZlczjlZljlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZlczjlZljlServiceImpl.class);
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;


    @Autowired
    private HlhtZlczjlZljlDao hlhtZlczjlZljlDao;

    public int createHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return this.hlhtZlczjlZljlDao.insertHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public int modifyHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return this.hlhtZlczjlZljlDao.updateHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public int removeHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return this.hlhtZlczjlZljlDao.deleteHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public HlhtZlczjlZljl getHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public int getHlhtZlczjlZljlCount(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return (Integer) this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljlCount(hlhtZlczjlZljl);
    }

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlList(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljlList(hlhtZlczjlZljl);
    }

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlPageList(HlhtZlczjlZljl hlhtZlczjlZljl) {
        return this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljlPageList(hlhtZlczjlZljl);
    }

    @Override
    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.hlhtZlczjlZljlDao.getHlhtZlczjlZljlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZlczjlZljlByYjlxh(HlhtZlczjlZljl hlhtZlczjlZljl) {
        this.hlhtZlczjlZljlDao.deleteHlhtZlczjlZljlByYjlxh(hlhtZlczjlZljl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZlczjlZljl() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;


        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZLCZJL_ZLJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZLCZJL_ZLJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZLCZJL_ZLJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZlczjlZljl> hlhtZlczjlZljlListFromBaseData = this.hlhtZlczjlZljlDao.getHlhtZlczjlZljlListFromBaseData(qtbljlk);
            if (hlhtZlczjlZljlListFromBaseData != null) {
                for (HlhtZlczjlZljl hlhtZlczjlZljl : hlhtZlczjlZljlListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZlczjlZljl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZlczjlZljl temp = new HlhtZlczjlZljl();
                    temp.setYjlxh(hlhtZlczjlZljl.getYjlxh());
                    this.hlhtZlczjlZljlDao.deleteHlhtZlczjlZljlByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZlczjlSxjl.class);
                    try {
                        hlhtZlczjlZljl = (HlhtZlczjlZljl) HicHelper.initModelValue(mbzDataSetList, document, hlhtZlczjlZljl, paramTypeMap);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    logger.info("Model:{}", hlhtZlczjlZljl);
                    this.hlhtZlczjlZljlDao.insertHlhtZlczjlZljl(hlhtZlczjlZljl);
                }
            }
        }
        return mbzDataChecks;
    }
}