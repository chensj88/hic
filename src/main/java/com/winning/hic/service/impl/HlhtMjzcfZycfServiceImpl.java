package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtMjzcfZycfDao;
import com.winning.hic.model.HlhtMjzcfZycf;
import com.winning.hic.service.HlhtMjzcfZycfService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class HlhtMjzcfZycfServiceImpl implements  HlhtMjzcfZycfService {

    @Autowired
    private HlhtMjzcfZycfDao hlhtMjzcfZycfDao;

    public int createHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf){
        return this.hlhtMjzcfZycfDao.insertHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public int modifyHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf){
        return this.hlhtMjzcfZycfDao.updateHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public int removeHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf){
        return this.hlhtMjzcfZycfDao.deleteHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public HlhtMjzcfZycf getHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf){
        return this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycf(hlhtMjzcfZycf);
    }

    public int getHlhtMjzcfZycfCount(HlhtMjzcfZycf hlhtMjzcfZycf){
        return (Integer)this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycfCount(hlhtMjzcfZycf);
    }

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfList(HlhtMjzcfZycf hlhtMjzcfZycf){
        return this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycfList(hlhtMjzcfZycf);
    }

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfPageList(HlhtMjzcfZycf hlhtMjzcfZycf){
        return this.hlhtMjzcfZycfDao.selectHlhtMjzcfZycfPageList(hlhtMjzcfZycf);
    }
}