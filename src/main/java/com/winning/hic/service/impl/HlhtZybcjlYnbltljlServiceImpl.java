package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlYnbltljlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlYnbltljlService;
import com.winning.hic.service.MbzDataCheckService;
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
 * @title HLHT_ZYBCJL_YNBLTLJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-34-31 16:34:53
 */
@Service
public class HlhtZybcjlYnbltljlServiceImpl implements HlhtZybcjlYnbltljlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlYnbltljlServiceImpl.class);
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private HlhtZybcjlYnbltljlDao hlhtZybcjlYnbltljlDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.insertHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int modifyHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.updateHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int removeHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public HlhtZybcjlYnbltljl getHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int getHlhtZybcjlYnbltljlCount(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return (Integer) this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlCount(hlhtZybcjlYnbltljl);
    }

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlList(hlhtZybcjlYnbltljl);
    }

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlPageList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlPageList(hlhtZybcjlYnbltljl);
    }

    @Override
    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.hlhtZybcjlYnbltljlDao.getHlhtZybcjlYnbltljlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZybcjlYnbltljlByYjlxh(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljlByYjlxh(hlhtZybcjlYnbltljl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlYnbltljl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZybcjlYnbltljl> hlhtZybcjlYnbltljlListFromBaseData = this.hlhtZybcjlYnbltljlDao.getHlhtZybcjlYnbltljlListFromBaseData(qtbljlk);
            emr_count = emr_count+hlhtZybcjlYnbltljlListFromBaseData.size();

            if (hlhtZybcjlYnbltljlListFromBaseData != null) {
                for (HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl : hlhtZybcjlYnbltljlListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZybcjlYnbltljl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZybcjlYnbltljl temp = new HlhtZybcjlYnbltljl();
                    temp.setYjlxh(hlhtZybcjlYnbltljl.getYjlxh());
                    this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljlByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlYnbltljl.class);
                    try {
                        hlhtZybcjlYnbltljl = (HlhtZybcjlYnbltljl) HicHelper.initModelValue(mbzDataSetList, document, hlhtZybcjlYnbltljl, paramTypeMap);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    logger.info("Model:{}", hlhtZybcjlYnbltljl);
                    this.hlhtZybcjlYnbltljlDao.insertHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
                    real_count++;

                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE));

        return mbzDataChecks;
    }
}