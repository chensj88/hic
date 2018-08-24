package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlSwjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzDictInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlSwjlService;
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
 * @title HLHT_ZYBCJL_SWJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-34-31 16:34:47
 */
@Service
public class HlhtZybcjlSwjlServiceImpl implements HlhtZybcjlSwjlService {
    private static final Logger logger = LoggerFactory.getLogger(HlhtZybcjlSwjlServiceImpl.class);

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private MbzDictInfoDao mbzDictInfoDao;
    @Autowired
    private HlhtZybcjlSwjlDao hlhtZybcjlSwjlDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;


    public int createHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return this.hlhtZybcjlSwjlDao.insertHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public int modifyHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return this.hlhtZybcjlSwjlDao.updateHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public int removeHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return this.hlhtZybcjlSwjlDao.deleteHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public HlhtZybcjlSwjl getHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public int getHlhtZybcjlSwjlCount(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return (Integer) this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlCount(hlhtZybcjlSwjl);
    }

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlList(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlList(hlhtZybcjlSwjl);
    }

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlPageList(HlhtZybcjlSwjl hlhtZybcjlSwjl) {
        return this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlPageList(hlhtZybcjlSwjl);
    }

    @Override
    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        MbzDictInfo nameTemp = new MbzDictInfo();
        nameTemp.setDictCode("hospitalInfoName");
        nameTemp.setDictValue("1");
        nameTemp = this.mbzDictInfoDao.selectMbzDictInfo(nameTemp);
        MbzDictInfo codeTemp = new MbzDictInfo();
        codeTemp.setDictCode("hospitalInfoNo");
        codeTemp.setDictValue("1");
        codeTemp = this.mbzDictInfoDao.selectMbzDictInfo(codeTemp);
        emrQtbljlk.getMap().put("zzjgdm", codeTemp.getDictLabel());
        emrQtbljlk.getMap().put("zzjgmc", nameTemp.getDictLabel());
        return this.hlhtZybcjlSwjlDao.getHlhtZybcjlSwjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZybcjlSwjlByYjlxh(HlhtZybcjlSwjl hlhtZybcjlSwjl) {

    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlSwjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZybcjlSwjl> hlhtZybcjlSwjlListFromBaseData = this.getHlhtZybcjlSwjlListFromBaseData(qtbljlk);
            emr_count = emr_count+hlhtZybcjlSwjlListFromBaseData.size();
            if (hlhtZybcjlSwjlListFromBaseData != null) {
                for (HlhtZybcjlSwjl hlhtZybcjlSwjl : hlhtZybcjlSwjlListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZybcjlSwjl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZybcjlSwjl temp = new HlhtZybcjlSwjl();
                    temp.setYjlxh(hlhtZybcjlSwjl.getYjlxh());
                    this.hlhtZybcjlSwjlDao.deleteHlhtZybcjlSwjlByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlSwjl.class);
                    try {
                        hlhtZybcjlSwjl = (HlhtZybcjlSwjl) HicHelper.initModelValue(mbzDataSetList, document, hlhtZybcjlSwjl, paramTypeMap);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    logger.info("Model:{}", hlhtZybcjlSwjl);
                    this.hlhtZybcjlSwjlDao.insertHlhtZybcjlSwjl(hlhtZybcjlSwjl);
                    real_count++;

                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE));
        return mbzDataChecks;
    }


}