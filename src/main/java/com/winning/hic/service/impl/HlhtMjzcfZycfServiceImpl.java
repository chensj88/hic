package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtMjzcfZycfDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtMjzcfZycf;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.model.MbzLoadDataInfo;
import com.winning.hic.service.HlhtMjzcfZycfService;
import com.winning.hic.service.MbzDataCheckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_MJZCF_ZYCF
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-30-31 16:30:02
 */
@Service
public class HlhtMjzcfZycfServiceImpl implements HlhtMjzcfZycfService {
    private final Logger logger = LoggerFactory.getLogger(HlhtMjzcfZycfServiceImpl.class);

    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private HlhtMjzcfZycfDao hlhtMjzcfZycfDao;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return this.hlhtMjzcfZycfDao.insertHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public int modifyHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return this.hlhtMjzcfZycfDao.updateHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public int removeHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return this.hlhtMjzcfZycfDao.deleteHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public HlhtMjzcfZycf getHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public int getHlhtMjzcfZycfCount(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return (Integer) this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycfCount(hlhtMjzcfZycf);
    }

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfList(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycfList(hlhtMjzcfZycf);
    }

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfPageList(HlhtMjzcfZycf hlhtMjzcfZycf) {
        return this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycfPageList(hlhtMjzcfZycf);
    }

    @Override
    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.commonQueryDao.getHlhtMjzcfZycfListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtMjzcfZycfByYjlxh(HlhtMjzcfZycf hlhtMjzcfZycf) {
        this.hlhtMjzcfZycfDao.deleteHlhtMjzcfZycfByYjlxh(hlhtMjzcfZycf);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtMjzcfZycf(MbzDataCheck entity) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
        emrQtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
        emrQtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
        List<HlhtMjzcfZycf> hlhtMjzcfZycfListFromBaseData = this.commonQueryDao.getHlhtMjzcfZycfListFromBaseData(emrQtbljlk);
        emr_count = hlhtMjzcfZycfListFromBaseData.size();
        if (hlhtMjzcfZycfListFromBaseData != null) {
            for (HlhtMjzcfZycf obj : hlhtMjzcfZycfListFromBaseData) {
                //清库
                HlhtMjzcfZycf temp = new HlhtMjzcfZycf();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtMjzcfZycfDao.deleteHlhtMjzcfZycfByYjlxh(temp);
                //清除日志
                Map<String,Object> param = new HashMap<>();
                param.put("SOURCE_ID",obj.getYjlxh());
                param.put("SOURCE_TYPE",Constants.WN_MJZCF_ZYCF_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                logger.info("Model:{}", obj);
                this.hlhtMjzcfZycfDao.insertHlhtMjzcfZycf(obj);
                //插入日志
                mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                        Long.parseLong(Constants.WN_MJZCF_ZYCF_SOURCE_TYPE),
                        Long.parseLong(obj.getYjlxh()),"中药处方","NA",new Timestamp(obj.getCfklrq().getTime()),
                        obj.getPatid(),obj.getMjzh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                        "NA","NA", "NA","NA", obj.getSfzhm()));
                real_count++;
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_MJZCF_ZYCF_SOURCE_TYPE));
        return mbzDataChecks;
    }
}