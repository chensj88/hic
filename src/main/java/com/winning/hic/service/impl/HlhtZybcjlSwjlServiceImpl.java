package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.*;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
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
    private CommonQueryDao commonQueryDao;
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
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

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
        return this.commonQueryDao.getHlhtZybcjlSwjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZybcjlSwjlByYjlxh(HlhtZybcjlSwjl hlhtZybcjlSwjl) {

    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlSwjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZybcjlSwjl hlhtZybcjlSwjlTemp = new HlhtZybcjlSwjl();
        hlhtZybcjlSwjlTemp.getMap().put("sourceType",Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE);
        hlhtZybcjlSwjlTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZybcjlSwjlTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZybcjlSwjlTemp.getMap().put("syxh", t.getMap().get("syxh"));

        //2.根据模板代码去找到对应的病人病历
        List<HlhtZybcjlSwjl> hlhtZybcjlSwjlList = this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlListByProc(hlhtZybcjlSwjlTemp);
        if (hlhtZybcjlSwjlList != null) {
            emr_count = emr_count + hlhtZybcjlSwjlList.size();
            for (HlhtZybcjlSwjl obj : hlhtZybcjlSwjlList) {
                //清库
                HlhtZybcjlSwjl temp = new HlhtZybcjlSwjl();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZybcjlSwjlDao.deleteHlhtZybcjlSwjlByYjlxh(temp);
                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlSwjl.class);
                try {
                    obj = (HlhtZybcjlSwjl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    logger.info("Model:{}", obj);
                    obj.setRyzdbm(obj.getRyzdbm() == null ? "NA" :obj.getRyzdbm().replace("西医诊断：", "").trim());
                    obj.setRyzdbm(obj.getRyzdbm() == null ? "NA" :obj.getRyzdbm().replace("中医诊断：", "").trim());
                    obj.setRyzdmc(obj.getRyzdmc() == null ? "NA" :obj.getRyzdmc().replace("西医诊断：", "").trim());
                    obj.setRyzdmc(obj.getRyzdmc() == null ? "NA" :obj.getRyzdmc().replace("中医诊断：", "").trim());
                    obj.setSwzdbm(obj.getSwzdbm() == null ? "NA" :obj.getSwzdbm().replace("西医诊断：", "").trim());
                    obj.setSwzdbm(obj.getSwzdbm() == null ? "NA" :obj.getSwzdbm().replace("中医诊断：", "").trim());
                    obj.setSwzdmc(obj.getSwzdmc() == null ? "NA" :obj.getSwzdmc().replace("西医诊断：", "").trim());
                    obj.setSwzdmc(obj.getSwzdmc() == null ? "NA" :obj.getSwzdmc().replace("中医诊断：", "").trim());
                    this.hlhtZybcjlSwjlDao.insertHlhtZybcjlSwjl(obj);
                    //插入日志
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE), obj, 0)));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                real_count++;

            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZYBCJL_SWJL_SOURCE_TYPE),t);
        return mbzDataChecks;
    }


}