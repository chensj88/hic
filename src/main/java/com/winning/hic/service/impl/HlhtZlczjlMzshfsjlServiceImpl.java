package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.*;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
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
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;
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
        return this.commonQueryDao.getHlhtZlczjlMzshfsjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZlczjlMzshfsjlByYjlxh(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl) {
        this.hlhtZlczjlMzshfsjlDao.deleteHlhtZlczjlMzshfsjlByYjlxh(hlhtZlczjlMzsqfsjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZlczjlMzshfsjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjlTemp = new HlhtZlczjlMzshfsjl();
        hlhtZlczjlMzshfsjlTemp.getMap().put("sourceType",Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE);
        hlhtZlczjlMzshfsjlTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZlczjlMzshfsjlTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZlczjlMzshfsjlTemp.getMap().put("syxh", t.getMap().get("syxh"));
        //2.根据模板代码去找到对应的病人病历
        List<HlhtZlczjlMzshfsjl> hlhtZlczjlMzshfsjlList = this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlListByProc(hlhtZlczjlMzshfsjlTemp);
        if (hlhtZlczjlMzshfsjlList != null) {
            emr_count = emr_count + hlhtZlczjlMzshfsjlList.size();
            for (HlhtZlczjlMzshfsjl obj : hlhtZlczjlMzshfsjlList) {
                //清库
                HlhtZlczjlMzshfsjl temp = new HlhtZlczjlMzshfsjl();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZlczjlMzshfsjlDao.deleteHlhtZlczjlMzshfsjlByYjlxh(temp);

                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZlczjlMzshfsjl.class);
                try {
                    obj = (HlhtZlczjlMzshfsjl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    logger.info("Model:{}", obj);
                    this.hlhtZlczjlMzshfsjlDao.insertHlhtZlczjlMzshfsjl(obj);
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE), obj, 0)));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                real_count++;
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZLCZJL_MZSHFSJL_SOURCE_TYPE),t);
        return mbzDataChecks;
    }

    @Override
    public List<HlhtZlczjlMzshfsjl> selectHlhtZlczjlMzshfsjlListByProc(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl) {
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlListByProc(hlhtZlczjlMzsqfsjl);
    }
}