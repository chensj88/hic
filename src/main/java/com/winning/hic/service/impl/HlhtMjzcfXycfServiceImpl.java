package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtMjzcfXycfDao;
import com.winning.hic.model.HlhtMjzcfXycf;
import com.winning.hic.service.HlhtMjzcfXycfService;
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

    @Autowired
    private HlhtMjzcfXycfDao hlhtMjzcfXycfDao;

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
}