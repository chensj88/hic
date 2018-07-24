package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtLog;  

import com.winning.hic.dao.HlhtLogDao;  

import com.winning.hic.service.HlhtLogService;  


/**
* @author HLHT
* @title HLHT_LOG
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-55-24 13:55:08
*/
@Service
public class HlhtLogServiceImpl implements  HlhtLogService {

    @Autowired
    private HlhtLogDao hlhtLogDao;

    public int createHlhtLog(HlhtLog hlhtLog){
        return this.hlhtLogDao.insertHlhtLog(hlhtLog);
    }

    public int modifyHlhtLog(HlhtLog hlhtLog){
        return this.hlhtLogDao.updateHlhtLog(hlhtLog);
    }

    public int removeHlhtLog(HlhtLog hlhtLog){
        return this.hlhtLogDao.deleteHlhtLog(hlhtLog);
    }

    public HlhtLog getHlhtLog(HlhtLog hlhtLog){
        return this.hlhtLogDao.selectHlhtLog(hlhtLog);
    }

    public int getHlhtLogCount(HlhtLog hlhtLog){
        return (Integer)this.hlhtLogDao.selectHlhtLogCount(hlhtLog);
    }

    public List<HlhtLog> getHlhtLogList(HlhtLog hlhtLog){
        return this.hlhtLogDao.selectHlhtLogList(hlhtLog);
    }

    public List<HlhtLog> getHlhtLogPageList(HlhtLog hlhtLog){
        return this.hlhtLogDao.selectHlhtLogPageList(hlhtLog);
    }
}