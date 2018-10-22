package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.*;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZqgzxxBwztzsService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_ZQGZXX_BWZTZS
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-32-31 16:32:15
 */
@Service
public class HlhtZqgzxxBwztzsServiceImpl implements HlhtZqgzxxBwztzsService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZqgzxxBwztzsServiceImpl.class);

    @Autowired
    private CommonQueryDao commonQueryDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private HlhtZqgzxxBwztzsDao hlhtZqgzxxBwztzsDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return this.hlhtZqgzxxBwztzsDao.insertHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public int modifyHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return this.hlhtZqgzxxBwztzsDao.updateHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public int removeHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return this.hlhtZqgzxxBwztzsDao.deleteHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public HlhtZqgzxxBwztzs getHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public int getHlhtZqgzxxBwztzsCount(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return (Integer) this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsCount(hlhtZqgzxxBwztzs);
    }

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsList(hlhtZqgzxxBwztzs);
    }

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsPageList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        return this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsPageList(hlhtZqgzxxBwztzs);
    }

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsListFromBaseData(EmrQtbljlk emrQtbljlk) {
        return this.commonQueryDao.getHlhtZqgzxxBwztzsListFromBaseData(emrQtbljlk);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZqgzxxBwztzs(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZqgzxxBwztzs hlhtZqgzxxBwztzsTemp = new HlhtZqgzxxBwztzs();
        hlhtZqgzxxBwztzsTemp.getMap().put("sourceType",Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE);
        hlhtZqgzxxBwztzsTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZqgzxxBwztzsTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZqgzxxBwztzsTemp.getMap().put("syxh", t.getMap().get("syxh"));

        //2.根据模板代码去找到对应的病人病历
        List<HlhtZqgzxxBwztzs> hlhtZqgzxxBwztzsList = this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsListByProc(hlhtZqgzxxBwztzsTemp);
        if (hlhtZqgzxxBwztzsList != null) {
            emr_count = emr_count + hlhtZqgzxxBwztzsList.size();
            for (HlhtZqgzxxBwztzs obj : hlhtZqgzxxBwztzsList) {
                //删除库中已存在数据
                HlhtZqgzxxBwztzs temp = new HlhtZqgzxxBwztzs();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZqgzxxBwztzsDao.deleteHlhtZqgzxxBwztzsByYjlxh(temp);

                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxBwztzs.class);
                try {
                    obj = (HlhtZqgzxxBwztzs) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    logger.info("Model:{}", obj);
                    this.hlhtZqgzxxBwztzsDao.insertHlhtZqgzxxBwztzs(obj);
                    //插入日志
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE), obj, 0)));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                real_count++;
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZQGZXX_BWZTZS_SOURCE_TYPE),t);

        return mbzDataChecks;
    }

    @Override
    public void deleteHlhtZqgzxxBwztzsByYjlxh(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) {
        this.hlhtZqgzxxBwztzsDao.deleteHlhtZqgzxxBwztzsByYjlxh(hlhtZqgzxxBwztzs);
    }
}