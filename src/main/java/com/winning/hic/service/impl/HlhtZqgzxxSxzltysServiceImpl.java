package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZqgzxxSxzltysDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZqgzxxSxzltysService;
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
 * @title HLHT_ZQGZXX_SXZLTYS
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-32-31 16:32:49
 */
@Service
public class HlhtZqgzxxSxzltysServiceImpl implements HlhtZqgzxxSxzltysService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZqgzxxSxzltysServiceImpl.class);
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private HlhtZqgzxxSxzltysDao hlhtZqgzxxSxzltysDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return this.hlhtZqgzxxSxzltysDao.insertHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public int modifyHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return this.hlhtZqgzxxSxzltysDao.updateHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public int removeHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return this.hlhtZqgzxxSxzltysDao.deleteHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public HlhtZqgzxxSxzltys getHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public int getHlhtZqgzxxSxzltysCount(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return (Integer) this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysCount(hlhtZqgzxxSxzltys);
    }

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysList(hlhtZqgzxxSxzltys);
    }

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysPageList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        return this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysPageList(hlhtZqgzxxSxzltys);
    }

    @Override
    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.hlhtZqgzxxSxzltysDao.getHlhtZqgzxxSxzltysListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZqgzxxSxzltysByYjlxh(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        this.hlhtZqgzxxSxzltysDao.deleteHlhtZqgzxxSxzltysByYjlxh(hlhtZqgzxxSxzltys);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZqgzxxSxzltys(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZqgzxxSxzltys> hlhtZqgzxxSxzltysListFromBaseData = this.hlhtZqgzxxSxzltysDao.getHlhtZqgzxxSxzltysListFromBaseData(qtbljlk);
            emr_count = emr_count+hlhtZqgzxxSxzltysListFromBaseData.size();

            if (hlhtZqgzxxSxzltysListFromBaseData != null) {
                for (HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys : hlhtZqgzxxSxzltysListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZqgzxxSxzltys.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZqgzxxSxzltys temp = new HlhtZqgzxxSxzltys();
                    temp.setYjlxh(hlhtZqgzxxSxzltys.getYjlxh());
                    this.hlhtZqgzxxSxzltysDao.deleteHlhtZqgzxxSxzltysByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxSxzltys.class);
                    try {
                        hlhtZqgzxxSxzltys = (HlhtZqgzxxSxzltys) HicHelper.initModelValue(mbzDataSetList, document, hlhtZqgzxxSxzltys, paramTypeMap);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    logger.info("Model:{}", hlhtZqgzxxSxzltys);
                    this.hlhtZqgzxxSxzltysDao.insertHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
                    real_count++;

                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE));

        return mbzDataChecks;
    }
}