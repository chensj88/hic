package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZcjlPgcDao;
import com.winning.hic.model.HlhtZcjlPgc;
import com.winning.hic.service.HlhtZcjlPgcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZCJL_PGC
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:59
*/
@Service
public class HlhtZcjlPgcServiceImpl implements  HlhtZcjlPgcService {

    @Autowired
    private HlhtZcjlPgcDao hlhtZcjlPgcDao;

    public int createHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.insertHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int modifyHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.updateHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int removeHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.deleteHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public HlhtZcjlPgc getHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int getHlhtZcjlPgcCount(HlhtZcjlPgc hlhtZcjlPgc){
        return (Integer)this.hlhtZcjlPgcDao.selectHlhtZcjlPgcCount(hlhtZcjlPgc);
    }

    public List<HlhtZcjlPgc> getHlhtZcjlPgcList(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgcList(hlhtZcjlPgc);
    }

    public List<HlhtZcjlPgc> getHlhtZcjlPgcPageList(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgcPageList(hlhtZcjlPgc);
    }
}