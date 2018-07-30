package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDataCheck;

import com.winning.hic.dao.data.MbzDataCheckDao;

import com.winning.hic.service.MbzDataCheckService;


/**
* @author MBZ
* @title MBZ_DATA_CHECK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:50
*/
@Service
public class MbzDataCheckServiceImpl implements  MbzDataCheckService {

    @Autowired
    private MbzDataCheckDao mbzDataCheckDao;

    public int createMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.insertMbzDataCheck(mbzDataCheck);
    }

    public int modifyMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.updateMbzDataCheck(mbzDataCheck);
    }

    public int removeMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.deleteMbzDataCheck(mbzDataCheck);
    }

    public MbzDataCheck getMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.selectMbzDataCheck(mbzDataCheck);
    }

    public int getMbzDataCheckCount(MbzDataCheck mbzDataCheck){
        return (Integer)this.mbzDataCheckDao.selectMbzDataCheckCount(mbzDataCheck);
    }

    public List<MbzDataCheck> getMbzDataCheckList(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.selectMbzDataCheckList(mbzDataCheck);
    }

    public List<MbzDataCheck> getMbzDataCheckPageList(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.selectMbzDataCheckPageList(mbzDataCheck);
    }
}