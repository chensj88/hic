package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZqgzxxSxzltysDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
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
    private CommonQueryDao commonQueryDao;
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

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

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
        return this.commonQueryDao.getHlhtZqgzxxSxzltysListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZqgzxxSxzltysByYjlxh(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) {
        this.hlhtZqgzxxSxzltysDao.deleteHlhtZqgzxxSxzltysByYjlxh(hlhtZqgzxxSxzltys);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZqgzxxSxzltys(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZqgzxxSxzltys hlhtZqgzxxSxzltysTemp = new HlhtZqgzxxSxzltys();
        hlhtZqgzxxSxzltysTemp.getMap().put("sourceType",Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE);
        hlhtZqgzxxSxzltysTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZqgzxxSxzltysTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZqgzxxSxzltysTemp.getMap().put("syxh", t.getMap().get("syxh"));
        //2.根据模板代码去找到对应的病人病历
        List<HlhtZqgzxxSxzltys> hlhtZqgzxxSxzltysList = this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysListByProc(hlhtZqgzxxSxzltysTemp);

        if (hlhtZqgzxxSxzltysList != null) {
            emr_count = emr_count + hlhtZqgzxxSxzltysList.size();
            for (HlhtZqgzxxSxzltys obj : hlhtZqgzxxSxzltysList) {
                //清库
                HlhtZqgzxxSxzltys temp = new HlhtZqgzxxSxzltys();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZqgzxxSxzltysDao.deleteHlhtZqgzxxSxzltysByYjlxh(temp);
                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxSxzltys.class);
                try {
                    obj = (HlhtZqgzxxSxzltys) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    String sxblhg = obj.getSxblhg().replaceAll("\\d+","0");
                    obj.setSxblhg(sxblhg);
                    logger.info("Model:{}", obj);
                    this.hlhtZqgzxxSxzltysDao.insertHlhtZqgzxxSxzltys(obj);
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE), obj, 0)));
                } catch (ParseException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                real_count++;

            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZQGZXX_SXZLTYS_SOURCE_TYPE),t);

        return mbzDataChecks;
    }
}