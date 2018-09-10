package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzLoadDataInfo;  

import com.winning.hic.dao.data.MbzLoadDataInfoDao;  

import com.winning.hic.service.MbzLoadDataInfoService;  


/**
* @author HLHT
* @title 【抽取数据明细数据】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-24-10 15:24:35
*/
@Service
public class MbzLoadDataInfoServiceImpl implements  MbzLoadDataInfoService {

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo){
        return this.mbzLoadDataInfoDao.insertMbzLoadDataInfo(mbzLoadDataInfo);
    }

    public int modifyMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo){
        return this.mbzLoadDataInfoDao.updateMbzLoadDataInfo(mbzLoadDataInfo);
    }

    public int removeMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo){
        return this.mbzLoadDataInfoDao.deleteMbzLoadDataInfo(mbzLoadDataInfo);
    }

    public MbzLoadDataInfo getMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo){
        return this.mbzLoadDataInfoDao.selectMbzLoadDataInfo(mbzLoadDataInfo);
    }

    public int getMbzLoadDataInfoCount(MbzLoadDataInfo mbzLoadDataInfo){
        return (Integer)this.mbzLoadDataInfoDao.selectMbzLoadDataInfoCount(mbzLoadDataInfo);
    }

    public List<MbzLoadDataInfo> getMbzLoadDataInfoList(MbzLoadDataInfo mbzLoadDataInfo){
        return this.mbzLoadDataInfoDao.selectMbzLoadDataInfoList(mbzLoadDataInfo);
    }

    public List<MbzLoadDataInfo> getMbzLoadDataInfoPageList(MbzLoadDataInfo mbzLoadDataInfo){
        return this.mbzLoadDataInfoDao.selectMbzLoadDataInfoPageList(mbzLoadDataInfo);
    }
}