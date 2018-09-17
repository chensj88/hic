package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZqgzxxMzzqtysDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZqgzxxMzzqtysService;
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
 * @title HLHT_ZQGZXX_MZZQTYS
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-32-31 16:32:23
 */
@Service
public class HlhtZqgzxxMzzqtysServiceImpl implements HlhtZqgzxxMzzqtysService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZqgzxxMzzqtysServiceImpl.class);
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private HlhtZqgzxxMzzqtysDao hlhtZqgzxxMzzqtysDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return this.hlhtZqgzxxMzzqtysDao.insertHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public int modifyHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return this.hlhtZqgzxxMzzqtysDao.updateHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public int removeHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return this.hlhtZqgzxxMzzqtysDao.deleteHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public HlhtZqgzxxMzzqtys getHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public int getHlhtZqgzxxMzzqtysCount(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return (Integer) this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtysCount(hlhtZqgzxxMzzqtys);
    }

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtysList(hlhtZqgzxxMzzqtys);
    }

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysPageList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        return this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtysPageList(hlhtZqgzxxMzzqtys);
    }

    @Override
    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.commonQueryDao.getHlhtZqgzxxMzzqtysListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZqgzxxMzzqtysByYjlxh(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) {
        this.deleteHlhtZqgzxxMzzqtysByYjlxh(hlhtZqgzxxMzzqtys);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZqgzxxMzzqtys(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_MZZQTYS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_MZZQTYS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZQGZXX_MZZQTYS_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
            qtbljlk.getMap().put("hisName", ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());

            //2.根据模板代码去找到对应的病人病历
            List<HlhtZqgzxxMzzqtys> hlhtZqgzxxMzzqtysListFromBaseData = this.commonQueryDao.getHlhtZqgzxxMzzqtysListFromBaseData(qtbljlk);
            emr_count = emr_count+hlhtZqgzxxMzzqtysListFromBaseData.size();

            if (hlhtZqgzxxMzzqtysListFromBaseData != null) {
                for (HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys : hlhtZqgzxxMzzqtysListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZqgzxxMzzqtys.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZqgzxxMzzqtys temp = new HlhtZqgzxxMzzqtys();
                    temp.setYjlxh(hlhtZqgzxxMzzqtys.getYjlxh());
                    this.hlhtZqgzxxMzzqtysDao.deleteHlhtZqgzxxMzzqtysByYjlxh(temp);
                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                    param.put("SOURCE_TYPE",Constants.WN_ZQGZXX_MZZQTYS_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxMzzqtys.class);
                    try {
                        hlhtZqgzxxMzzqtys = (HlhtZqgzxxMzzqtys) HicHelper.initModelValue(mbzDataSetList, document, hlhtZqgzxxMzzqtys, paramTypeMap);
                        logger.info("Model:{}", hlhtZqgzxxMzzqtys);
                        this.hlhtZqgzxxMzzqtysDao.insertHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZQGZXX_MZZQTYS_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(), emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                hlhtZqgzxxMzzqtys.getPatid(),hlhtZqgzxxMzzqtys.getZyh(),hlhtZqgzxxMzzqtys.getHzxm(),hlhtZqgzxxMzzqtys.getXbmc(),hlhtZqgzxxMzzqtys.getXbdm(),
                                hlhtZqgzxxMzzqtys.getKsmc(), hlhtZqgzxxMzzqtys.getKsdm(),   hlhtZqgzxxMzzqtys.getBqmc(),hlhtZqgzxxMzzqtys.getBqdm(), hlhtZqgzxxMzzqtys.getSfzhm()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    real_count++;

                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZQGZXX_MZZQTYS_SOURCE_TYPE));
        return mbzDataChecks;
    }
}