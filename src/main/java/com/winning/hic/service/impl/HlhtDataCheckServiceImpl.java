package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtDataCheck;  

import com.winning.hic.dao.HlhtDataCheckDao;  

import com.winning.hic.service.HlhtDataCheckService;  


/**
* @author HLHT
* @title HLHT_DATA_CHECK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-55-24 13:55:05
*/
@Service
public class HlhtDataCheckServiceImpl implements  HlhtDataCheckService {

    @Autowired
    private HlhtDataCheckDao hlhtDataCheckDao;

    public int createHlhtDataCheck(HlhtDataCheck hlhtDataCheck){
        return this.hlhtDataCheckDao.insertHlhtDataCheck(hlhtDataCheck);
    }

    public int modifyHlhtDataCheck(HlhtDataCheck hlhtDataCheck){
        return this.hlhtDataCheckDao.updateHlhtDataCheck(hlhtDataCheck);
    }

    public int removeHlhtDataCheck(HlhtDataCheck hlhtDataCheck){
        return this.hlhtDataCheckDao.deleteHlhtDataCheck(hlhtDataCheck);
    }

    public HlhtDataCheck getHlhtDataCheck(HlhtDataCheck hlhtDataCheck){
        return this.hlhtDataCheckDao.selectHlhtDataCheck(hlhtDataCheck);
    }

    public int getHlhtDataCheckCount(HlhtDataCheck hlhtDataCheck){
        return (Integer)this.hlhtDataCheckDao.selectHlhtDataCheckCount(hlhtDataCheck);
    }

    public List<HlhtDataCheck> getHlhtDataCheckList(HlhtDataCheck hlhtDataCheck){
        return this.hlhtDataCheckDao.selectHlhtDataCheckList(hlhtDataCheck);
    }

    public List<HlhtDataCheck> getHlhtDataCheckPageList(HlhtDataCheck hlhtDataCheck){
        return this.hlhtDataCheckDao.selectHlhtDataCheckPageList(hlhtDataCheck);
    }
}