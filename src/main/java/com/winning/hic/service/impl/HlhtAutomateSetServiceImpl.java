package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtAutomateSet;  

import com.winning.hic.dao.data.HlhtAutomateSetDao;  

import com.winning.hic.service.HlhtAutomateSetService;  


/**
* @author HLHT
* @title HLHT_AUTOMATE_SET
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:48
*/
@Service
public class HlhtAutomateSetServiceImpl implements  HlhtAutomateSetService {

    @Autowired
    private HlhtAutomateSetDao hlhtAutomateSetDao;

    public int createHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet){
        return this.hlhtAutomateSetDao.insertHlhtAutomateSet(hlhtAutomateSet);
    }

    public int modifyHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet){
        return this.hlhtAutomateSetDao.updateHlhtAutomateSet(hlhtAutomateSet);
    }

    public int removeHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet){
        return this.hlhtAutomateSetDao.deleteHlhtAutomateSet(hlhtAutomateSet);
    }

    public HlhtAutomateSet getHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet){
        return this.hlhtAutomateSetDao.selectHlhtAutomateSet(hlhtAutomateSet);
    }

    public int getHlhtAutomateSetCount(HlhtAutomateSet hlhtAutomateSet){
        return (Integer)this.hlhtAutomateSetDao.selectHlhtAutomateSetCount(hlhtAutomateSet);
    }

    public List<HlhtAutomateSet> getHlhtAutomateSetList(HlhtAutomateSet hlhtAutomateSet){
        return this.hlhtAutomateSetDao.selectHlhtAutomateSetList(hlhtAutomateSet);
    }

    public List<HlhtAutomateSet> getHlhtAutomateSetPageList(HlhtAutomateSet hlhtAutomateSet){
        return this.hlhtAutomateSetDao.selectHlhtAutomateSetPageList(hlhtAutomateSet);
    }
}