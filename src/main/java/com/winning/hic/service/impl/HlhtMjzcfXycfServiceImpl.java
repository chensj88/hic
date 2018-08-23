package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.data.HlhtMjzcfXycfDao;
import com.winning.hic.model.HlhtMjzcfXycf;
import com.winning.hic.model.HlhtMjzcfZycf;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.HlhtMjzcfXycfService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_MJZCF_XYCF
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:53
*/
@Service
public class HlhtMjzcfXycfServiceImpl implements  HlhtMjzcfXycfService {
    private final Logger logger = LoggerFactory.getLogger(HlhtMjzcfXycfServiceImpl.class);
    @Autowired
    private HlhtMjzcfXycfDao hlhtMjzcfXycfDao;
    @Autowired
    private CommonQueryDao commonQueryDao;

    public int createHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf){
        return this.hlhtMjzcfXycfDao.insertHlhtMjzcfXycf(hlhtMjzcfXycf);
    }

    public int modifyHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf){
        return this.hlhtMjzcfXycfDao.updateHlhtMjzcfXycf(hlhtMjzcfXycf);
    }

    public int removeHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf){
        return this.hlhtMjzcfXycfDao.deleteHlhtMjzcfXycf(hlhtMjzcfXycf);
    }

    public HlhtMjzcfXycf getHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf){
        return this.hlhtMjzcfXycfDao.selectHlhtMjzcfXycf(hlhtMjzcfXycf);
    }

    public int getHlhtMjzcfXycfCount(HlhtMjzcfXycf hlhtMjzcfXycf){
        return (Integer)this.hlhtMjzcfXycfDao.selectHlhtMjzcfXycfCount(hlhtMjzcfXycf);
    }

    public List<HlhtMjzcfXycf> getHlhtMjzcfXycfList(HlhtMjzcfXycf hlhtMjzcfXycf){
        return this.hlhtMjzcfXycfDao.selectHlhtMjzcfXycfList(hlhtMjzcfXycf);
    }

    public List<HlhtMjzcfXycf> getHlhtMjzcfXycfPageList(HlhtMjzcfXycf hlhtMjzcfXycf){
        return this.hlhtMjzcfXycfDao.selectHlhtMjzcfXycfPageList(hlhtMjzcfXycf);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtMjzcfXycf(MbzDataCheck entity) {
        List<MbzDataCheck> dataChecks = null;
        HlhtMjzcfXycf xycf = new HlhtMjzcfXycf();
        xycf.getMap().put("startDate",entity.getMap().get("startDate"));
        xycf.getMap().put("endDate",entity.getMap().get("endDate"));
        List<HlhtMjzcfXycf> mjzcfXycfList = this.commonQueryDao.selectInitHlhtMjzcfXycf(xycf);
        for (HlhtMjzcfXycf mjzcfXycf : mjzcfXycfList) {
            HlhtMjzcfXycf tempXycf = new HlhtMjzcfXycf();
            tempXycf.setYjlxh(mjzcfXycf.getYjlxh());
            this.hlhtMjzcfXycfDao.deleteHlhtMjzcfXycf(tempXycf);
            logger.info("Model:{}", mjzcfXycf);
            this.hlhtMjzcfXycfDao.insertHlhtMjzcfXycf(mjzcfXycf);
        }
        return dataChecks;
    }
}