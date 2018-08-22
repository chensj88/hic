package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZlczjlMzshfsjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzDictInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZlczjlMzshfsjlService;
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
 * @title HLHT_ZLCZJL_MZSHFSJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-31-31 16:31:27
 */
@Service
public class HlhtZlczjlMzshfsjlServiceImpl implements HlhtZlczjlMzshfsjlService {
    private static final Logger logger = LoggerFactory.getLogger(HlhtZlczjlMzshfsjlServiceImpl.class);

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private MbzDictInfoDao mbzDictInfoDao;
    @Autowired
    private HlhtZlczjlMzshfsjlDao hlhtZlczjlMzshfsjlDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.insertHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public int modifyHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.updateHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public int removeHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.deleteHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public HlhtZlczjlMzshfsjl getHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public int getHlhtZlczjlMzshfsjlCount(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return (Integer) this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlCount(hlhtZlczjlMzshfsjl);
    }

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlList(hlhtZlczjlMzshfsjl);
    }

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlPageList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlPageList(hlhtZlczjlMzshfsjl);
    }

    @Override
    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
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
        return this.hlhtZlczjlMzshfsjlDao.getHlhtZlczjlMzshfsjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZlczjlMzshfsjlByYjlxh(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl) {
        this.hlhtZlczjlMzshfsjlDao.deleteHlhtZlczjlMzshfsjlByYjlxh(hlhtZlczjlMzsqfsjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZlczjlMzshfsjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZlczjlMzshfsjl> hlhtZlczjlMzshfsjlListFromBaseData = this.getHlhtZlczjlMzshfsjlListFromBaseData(qtbljlk);
            emr_count = emr_count+hlhtZlczjlMzshfsjlListFromBaseData.size();
            if (hlhtZlczjlMzshfsjlListFromBaseData != null) {
                for (HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl : hlhtZlczjlMzshfsjlListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZlczjlMzshfsjl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZlczjlMzshfsjl temp = new HlhtZlczjlMzshfsjl();
                    temp.setYjlxh(hlhtZlczjlMzshfsjl.getYjlxh());
                    this.hlhtZlczjlMzshfsjlDao.deleteHlhtZlczjlMzshfsjlByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZlczjlMzshfsjl.class);
                    try {
                        hlhtZlczjlMzshfsjl = (HlhtZlczjlMzshfsjl) HicHelper.initModelValue(mbzDataSetList, document, hlhtZlczjlMzshfsjl, paramTypeMap);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    logger.info("Model:{}", hlhtZlczjlMzshfsjl);
                    this.hlhtZlczjlMzshfsjlDao.insertHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
                    real_count++;

                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE));
        return mbzDataChecks;
    }
}