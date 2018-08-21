package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtBlgyWssjzyDao;
import com.winning.hic.model.HlhtBlgyWssjzy;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.HlhtBlgyWssjzyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_BLGY_WSSJZY
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:04
*/
@Service
public class HlhtBlgyWssjzyServiceImpl implements  HlhtBlgyWssjzyService {

    @Autowired
    private HlhtBlgyWssjzyDao hlhtBlgyWssjzyDao;

    public int createHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.insertHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public int modifyHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.updateHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public int removeHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.deleteHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public HlhtBlgyWssjzy getHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public int getHlhtBlgyWssjzyCount(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return (Integer)this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyCount(hlhtBlgyWssjzy);
    }

    public List<HlhtBlgyWssjzy> getHlhtBlgyWssjzyList(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyList(hlhtBlgyWssjzy);
    }

    public List<HlhtBlgyWssjzy> getHlhtBlgyWssjzyPageList(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyPageList(hlhtBlgyWssjzy);
    }

    @Override
    public MbzDataCheck interfaceHlhtBlgyWssjzy() {


        return null;
    }
}