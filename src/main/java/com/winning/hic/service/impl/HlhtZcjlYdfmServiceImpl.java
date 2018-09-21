package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZcjlYdfmDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZcjlYdfmService;
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
 * @title HLHT_ZCJL_YDFM
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-31-31 16:31:19
 */
@Service
public class HlhtZcjlYdfmServiceImpl implements HlhtZcjlYdfmService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZcjlYdfmServiceImpl.class);

    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private HlhtZcjlYdfmDao hlhtZcjlYdfmDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return this.hlhtZcjlYdfmDao.insertHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public int modifyHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return this.hlhtZcjlYdfmDao.updateHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public int removeHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return this.hlhtZcjlYdfmDao.deleteHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public HlhtZcjlYdfm getHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public int getHlhtZcjlYdfmCount(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return (Integer) this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfmCount(hlhtZcjlYdfm);
    }

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmList(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfmList(hlhtZcjlYdfm);
    }

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmPageList(HlhtZcjlYdfm hlhtZcjlYdfm) {
        return this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfmPageList(hlhtZcjlYdfm);
    }

    @Override
    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.commonQueryDao.getHlhtZcjlYdfmListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZcjlYdfmByYjlxh(HlhtZcjlYdfm hlhtZcjlYdfm) {
        this.hlhtZcjlYdfmDao.deleteHlhtZcjlYdfmByYjlxh(hlhtZcjlYdfm);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZcjlYdfm(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZCJL_YDFM_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZCJL_YDFM_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZCJL_YDFM_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate", t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate", t.getMap().get("endDate"));
            qtbljlk.getMap().put("syxh",t.getMap().get("syxh"));
            qtbljlk.getMap().put("hisName", ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZcjlYdfm> hlhtZcjlYdfmListFromBaseData = this.commonQueryDao.getHlhtZcjlYdfmListFromBaseData(qtbljlk);
            emr_count = emr_count + hlhtZcjlYdfmListFromBaseData.size();

            if (hlhtZcjlYdfmListFromBaseData != null) {
                for (HlhtZcjlYdfm hlhtZcjlYdfm : hlhtZcjlYdfmListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZcjlYdfm.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZcjlYdfm temp = new HlhtZcjlYdfm();
                    temp.setYjlxh(hlhtZcjlYdfm.getYjlxh());
                    this.hlhtZcjlYdfmDao.deleteHlhtZcjlYdfmByYjlxh(temp);
                    //清除日志
                    Map<String, Object> param = new HashMap<>();
                    param.put("SOURCE_ID", emrQtbljlk.getQtbljlxh());
                    param.put("SOURCE_TYPE", Constants.WN_ZCJL_YDFM_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZlczjlSxjl.class);
                    try {
                        hlhtZcjlYdfm = (HlhtZcjlYdfm) HicHelper.initModelValue(mbzDataSetList, document, hlhtZcjlYdfm, paramTypeMap);
                        logger.info("Model:{}", hlhtZcjlYdfm);
                        this.hlhtZcjlYdfmDao.insertHlhtZcjlYdfm(hlhtZcjlYdfm);
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZCJL_YDFM_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(), emrQtbljlk.getBlmc(), emrQtbljlk.getSyxh() + "",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(), DateUtil.PATTERN_19).getTime()),
                                hlhtZcjlYdfm.getPatid(), hlhtZcjlYdfm.getZyh(), hlhtZcjlYdfm.getCfxm(), "女", "2",
                                hlhtZcjlYdfm.getKsmc(), hlhtZcjlYdfm.getKsdm(), hlhtZcjlYdfm.getBqmc(), hlhtZcjlYdfm.getBqdm(), hlhtZcjlYdfm.getSfzhm()));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    real_count++;

                }
            }
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZCJL_YDFM_SOURCE_TYPE));

        return mbzDataChecks;
    }
}