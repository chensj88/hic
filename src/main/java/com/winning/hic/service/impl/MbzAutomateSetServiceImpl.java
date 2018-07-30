package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzAutomateSet;

import com.winning.hic.dao.data.MbzAutomateSetDao;

import com.winning.hic.service.MbzAutomateSetService;


/**
* @author MBZ
* @title MBZ_AUTOMATE_SET
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:48
*/
@Service
public class MbzAutomateSetServiceImpl implements  MbzAutomateSetService {

    @Autowired
    private MbzAutomateSetDao mbzAutomateSetDao;

    public int createMbzAutomateSet(MbzAutomateSet mbzAutomateSet){
        return this.mbzAutomateSetDao.insertMbzAutomateSet(mbzAutomateSet);
    }

    public int modifyMbzAutomateSet(MbzAutomateSet mbzAutomateSet){
        return this.mbzAutomateSetDao.updateMbzAutomateSet(mbzAutomateSet);
    }

    public int removeMbzAutomateSet(MbzAutomateSet mbzAutomateSet){
        return this.mbzAutomateSetDao.deleteMbzAutomateSet(mbzAutomateSet);
    }

    public MbzAutomateSet getMbzAutomateSet(MbzAutomateSet mbzAutomateSet){
        return this.mbzAutomateSetDao.selectMbzAutomateSet(mbzAutomateSet);
    }

    public int getMbzAutomateSetCount(MbzAutomateSet mbzAutomateSet){
        return (Integer)this.mbzAutomateSetDao.selectMbzAutomateSetCount(mbzAutomateSet);
    }

    public List<MbzAutomateSet> getMbzAutomateSetList(MbzAutomateSet mbzAutomateSet){
        return this.mbzAutomateSetDao.selectMbzAutomateSetList(mbzAutomateSet);
    }

    public List<MbzAutomateSet> getMbzAutomateSetPageList(MbzAutomateSet mbzAutomateSet){
        return this.mbzAutomateSetDao.selectMbzAutomateSetPageList(mbzAutomateSet);
    }
}