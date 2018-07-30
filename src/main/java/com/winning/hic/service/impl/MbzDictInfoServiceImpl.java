package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDictInfo;

import com.winning.hic.dao.data.MbzDictInfoDao;

import com.winning.hic.service.MbzDictInfoService;


/**
* @author MBZ
* @title 【字典表】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:53
*/
@Service
public class MbzDictInfoServiceImpl implements  MbzDictInfoService {

    @Autowired
    private MbzDictInfoDao mbzDictInfoDao;

    public int createMbzDictInfo(MbzDictInfo mbzDictInfo){
        return this.mbzDictInfoDao.insertMbzDictInfo(mbzDictInfo);
    }

    public int modifyMbzDictInfo(MbzDictInfo mbzDictInfo){
        return this.mbzDictInfoDao.updateMbzDictInfo(mbzDictInfo);
    }

    public int removeMbzDictInfo(MbzDictInfo mbzDictInfo){
        return this.mbzDictInfoDao.deleteMbzDictInfo(mbzDictInfo);
    }

    public MbzDictInfo getMbzDictInfo(MbzDictInfo mbzDictInfo){
        return this.mbzDictInfoDao.selectMbzDictInfo(mbzDictInfo);
    }

    public int getMbzDictInfoCount(MbzDictInfo mbzDictInfo){
        return (Integer)this.mbzDictInfoDao.selectMbzDictInfoCount(mbzDictInfo);
    }

    public List<MbzDictInfo> getMbzDictInfoList(MbzDictInfo mbzDictInfo){
        return this.mbzDictInfoDao.selectMbzDictInfoList(mbzDictInfo);
    }

    public List<MbzDictInfo> getMbzDictInfoPageList(MbzDictInfo mbzDictInfo){
        return this.mbzDictInfoDao.selectMbzDictInfoPageList(mbzDictInfo);
    }
}