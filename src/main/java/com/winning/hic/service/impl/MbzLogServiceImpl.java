package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzLog;

import com.winning.hic.dao.data.MbzLogDao;

import com.winning.hic.service.MbzLogService;


/**
* @author MBZ
* @title MBZ_LOG
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:54
*/
@Service
public class MbzLogServiceImpl implements  MbzLogService {

    @Autowired
    private MbzLogDao mbzLogDao;

    public int createMbzLog(MbzLog mbzLog){
        return this.mbzLogDao.insertMbzLog(mbzLog);
    }

    public int modifyMbzLog(MbzLog mbzLog){
        return this.mbzLogDao.updateMbzLog(mbzLog);
    }

    public int removeMbzLog(MbzLog mbzLog){
        return this.mbzLogDao.deleteMbzLog(mbzLog);
    }

    public MbzLog getMbzLog(MbzLog mbzLog){
        return this.mbzLogDao.selectMbzLog(mbzLog);
    }

    public int getMbzLogCount(MbzLog mbzLog){
        return (Integer)this.mbzLogDao.selectMbzLogCount(mbzLog);
    }

    public List<MbzLog> getMbzLogList(MbzLog mbzLog){
        return this.mbzLogDao.selectMbzLogList(mbzLog);
    }

    public List<MbzLog> getMbzLogPageList(MbzLog mbzLog){
        return this.mbzLogDao.selectMbzLogPageList(mbzLog);
    }
}