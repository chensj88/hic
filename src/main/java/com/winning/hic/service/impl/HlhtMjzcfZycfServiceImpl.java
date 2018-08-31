package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtMjzcfZycfDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtMjzcfZycf;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.HlhtMjzcfZycfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;


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
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private HlhtMjzcfZycfDao hlhtMjzcfZycfDao;

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
        return this.hlhtMjzcfZycfDao.getHlhtMjzcfZycfListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtMjzcfZycfByYjlxh(HlhtMjzcfZycf hlhtMjzcfZycf) {
        this.hlhtMjzcfZycfDao.deleteHlhtMjzcfZycfByYjlxh(hlhtMjzcfZycf);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtMjzcfZycf(MbzDataCheck entity) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
        emrQtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
        emrQtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
        List<HlhtMjzcfZycf> hlhtMjzcfZycfListFromBaseData = this.hlhtMjzcfZycfDao.getHlhtMjzcfZycfListFromBaseData(emrQtbljlk);
        if (hlhtMjzcfZycfListFromBaseData != null) {
            for (HlhtMjzcfZycf hlhtMjzcfZycf : hlhtMjzcfZycfListFromBaseData) {
                //清库
                HlhtMjzcfZycf temp = new HlhtMjzcfZycf();
                temp.setYjlxh(hlhtMjzcfZycf.getYjlxh());
                this.hlhtMjzcfZycfDao.deleteHlhtMjzcfZycfByYjlxh(temp);
                logger.info("Model:{}", hlhtMjzcfZycf);
                this.hlhtMjzcfZycfDao.insertHlhtMjzcfZycf(hlhtMjzcfZycf);
            }
        }
        return mbzDataChecks;
    }
}