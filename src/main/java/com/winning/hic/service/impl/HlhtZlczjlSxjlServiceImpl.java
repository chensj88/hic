package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZlczjlSxjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZlczjlSxjlService;
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
 * @title HLHT_ZLCZJL_SXJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-31-31 16:31:46
 */
@Service
public class HlhtZlczjlSxjlServiceImpl implements HlhtZlczjlSxjlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZlczjlSxjlServiceImpl.class);
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
    private HlhtZlczjlSxjlDao hlhtZlczjlSxjlDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return this.hlhtZlczjlSxjlDao.insertHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public int modifyHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return this.hlhtZlczjlSxjlDao.updateHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public int removeHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return this.hlhtZlczjlSxjlDao.deleteHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public HlhtZlczjlSxjl getHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public int getHlhtZlczjlSxjlCount(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return (Integer) this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlCount(hlhtZlczjlSxjl);
    }

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlList(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlList(hlhtZlczjlSxjl);
    }

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlPageList(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        return this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlPageList(hlhtZlczjlSxjl);
    }

    @Override
    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.commonQueryDao.getHlhtZlczjlSxjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZlczjlSxjlByYjlxh(HlhtZlczjlSxjl hlhtZlczjlSxjl) {
        this.deleteHlhtZlczjlSxjlByYjlxh(hlhtZlczjlSxjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZlczjlSxjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZlczjlSxjl hlhtZlczjlSxjlTemp = new HlhtZlczjlSxjl();
        hlhtZlczjlSxjlTemp.getMap().put("sourceType",Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE);
        hlhtZlczjlSxjlTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZlczjlSxjlTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZlczjlSxjlTemp.getMap().put("syxh", t.getMap().get("syxh"));
        //2.根据模板代码去找到对应的病人病历
        List<HlhtZlczjlSxjl> hlhtZlczjlSxjls = this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlListByProc(hlhtZlczjlSxjlTemp);
        if (hlhtZlczjlSxjls != null) {
            emr_count = emr_count + hlhtZlczjlSxjls.size();
            for (HlhtZlczjlSxjl obj : hlhtZlczjlSxjls) {
                //清库
                HlhtZlczjlSxjl temp = new HlhtZlczjlSxjl();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZlczjlSxjlDao.deleteHlhtZlczjlSxjlByYjlxh(temp);
                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZlczjlSxjl.class);
                try {
                    obj = (HlhtZlczjlSxjl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    logger.info("Model:{}", obj);
                    this.hlhtZlczjlSxjlDao.insertHlhtZlczjlSxjl(obj);
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE), obj, 0)));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                real_count++;

            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZLCZJL_SXJL_SOURCE_TYPE),t);

        return mbzDataChecks;
    }
}