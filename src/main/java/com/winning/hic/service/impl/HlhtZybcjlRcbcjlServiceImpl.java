package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlRcbcjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlRcbcjlService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
 * @title HLHT_ZYBCJL_RCBCJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-33-31 16:33:54
 */
@Service
public class HlhtZybcjlRcbcjlServiceImpl implements HlhtZybcjlRcbcjlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlRcbcjlServiceImpl.class);
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private HlhtZybcjlRcbcjlDao hlhtZybcjlRcbcjlDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.insertHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int modifyHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.updateHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int removeHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public HlhtZybcjlRcbcjl getHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int getHlhtZybcjlRcbcjlCount(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return (Integer) this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlCount(hlhtZybcjlRcbcjl);
    }

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlList(hlhtZybcjlRcbcjl);
    }

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlPageList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlPageList(hlhtZybcjlRcbcjl);
    }

    @Override
    public List<HlhtZybcjlRcbcjl> getHlhtRyjlJbxxListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.commonQueryDao.getHlhtZybcjlRcbcjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtRyjlJbxxByYjlxh(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlRcbcjl(MbzDataCheck t) throws Exception {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZybcjlRcbcjl hlhtZybcjlRcbcjlTemp = new HlhtZybcjlRcbcjl();
        hlhtZybcjlRcbcjlTemp.getMap().put("sourceType",Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE);
        hlhtZybcjlRcbcjlTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZybcjlRcbcjlTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZybcjlRcbcjlTemp.getMap().put("syxh", t.getMap().get("syxh"));
        //2.根据模板代码去找到对应的病人病历
        List<HlhtZybcjlRcbcjl> hlhtZybcjlRcbcjlList = this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlByProc(hlhtZybcjlRcbcjlTemp);
        if (hlhtZybcjlRcbcjlList != null) {
            emr_count = emr_count + hlhtZybcjlRcbcjlList.size();
            for (HlhtZybcjlRcbcjl obj : hlhtZybcjlRcbcjlList) {
                //清库
                HlhtZybcjlRcbcjl temp = new HlhtZybcjlRcbcjl();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjlByYjlxh(temp);
                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlRcbcjl.class);
                try {
                    obj = (HlhtZybcjlRcbcjl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                logger.info("Model:{}", obj);
                this.hlhtZybcjlRcbcjlDao.insertHlhtZybcjlRcbcjl(obj);
                mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                        Long.parseLong(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE),
                        Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                        obj.getFssj(),
                        obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                        obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE), obj, 1),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE), obj, 0)));
                real_count++;

            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE),t);

        return mbzDataChecks;
    }
}