package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtDictInfo;  

import com.winning.hic.dao.HlhtDictInfoDao;  

import com.winning.hic.service.HlhtDictInfoService;  


/**
* @author HLHT
* @title 【字典表】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-55-24 13:55:07
*/
@Service
public class HlhtDictInfoServiceImpl implements  HlhtDictInfoService {

    @Autowired
    private HlhtDictInfoDao hlhtDictInfoDao;

    public int createHlhtDictInfo(HlhtDictInfo hlhtDictInfo){
        return this.hlhtDictInfoDao.insertHlhtDictInfo(hlhtDictInfo);
    }

    public int modifyHlhtDictInfo(HlhtDictInfo hlhtDictInfo){
        return this.hlhtDictInfoDao.updateHlhtDictInfo(hlhtDictInfo);
    }

    public int removeHlhtDictInfo(HlhtDictInfo hlhtDictInfo){
        return this.hlhtDictInfoDao.deleteHlhtDictInfo(hlhtDictInfo);
    }

    public HlhtDictInfo getHlhtDictInfo(HlhtDictInfo hlhtDictInfo){
        return this.hlhtDictInfoDao.selectHlhtDictInfo(hlhtDictInfo);
    }

    public int getHlhtDictInfoCount(HlhtDictInfo hlhtDictInfo){
        return (Integer)this.hlhtDictInfoDao.selectHlhtDictInfoCount(hlhtDictInfo);
    }

    public List<HlhtDictInfo> getHlhtDictInfoList(HlhtDictInfo hlhtDictInfo){
        return this.hlhtDictInfoDao.selectHlhtDictInfoList(hlhtDictInfo);
    }

    public List<HlhtDictInfo> getHlhtDictInfoPageList(HlhtDictInfo hlhtDictInfo){
        return this.hlhtDictInfoDao.selectHlhtDictInfoPageList(hlhtDictInfo);
    }
}