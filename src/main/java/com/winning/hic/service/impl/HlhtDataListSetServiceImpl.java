package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtDataListSet;  

import com.winning.hic.dao.data.HlhtDataListSetDao;  

import com.winning.hic.service.HlhtDataListSetService;  


/**
* @author HLHT
* @title HLHT_DATA_LIST_SET
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:50
*/
@Service
public class HlhtDataListSetServiceImpl implements  HlhtDataListSetService {

    @Autowired
    private HlhtDataListSetDao hlhtDataListSetDao;

    public int createHlhtDataListSet(HlhtDataListSet hlhtDataListSet){
        return this.hlhtDataListSetDao.insertHlhtDataListSet(hlhtDataListSet);
    }

    public int modifyHlhtDataListSet(HlhtDataListSet hlhtDataListSet){
        return this.hlhtDataListSetDao.updateHlhtDataListSet(hlhtDataListSet);
    }

    public int removeHlhtDataListSet(HlhtDataListSet hlhtDataListSet){
        return this.hlhtDataListSetDao.deleteHlhtDataListSet(hlhtDataListSet);
    }

    public HlhtDataListSet getHlhtDataListSet(HlhtDataListSet hlhtDataListSet){
        return this.hlhtDataListSetDao.selectHlhtDataListSet(hlhtDataListSet);
    }

    public int getHlhtDataListSetCount(HlhtDataListSet hlhtDataListSet){
        return (Integer)this.hlhtDataListSetDao.selectHlhtDataListSetCount(hlhtDataListSet);
    }

    public List<HlhtDataListSet> getHlhtDataListSetList(HlhtDataListSet hlhtDataListSet){
        return this.hlhtDataListSetDao.selectHlhtDataListSetList(hlhtDataListSet);
    }

    public List<HlhtDataListSet> getHlhtDataListSetPageList(HlhtDataListSet hlhtDataListSet){
        return this.hlhtDataListSetDao.selectHlhtDataListSetPageList(hlhtDataListSet);
    }
}