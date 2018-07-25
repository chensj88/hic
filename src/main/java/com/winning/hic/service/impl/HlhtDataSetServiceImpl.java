package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtDataSet;  

import com.winning.hic.dao.data.HlhtDataSetDao;  

import com.winning.hic.service.HlhtDataSetService;  


/**
* @author HLHT
* @title 基础数据配置表服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:52
*/
@Service
public class HlhtDataSetServiceImpl implements  HlhtDataSetService {

    @Autowired
    private HlhtDataSetDao hlhtDataSetDao;

    public int createHlhtDataSet(HlhtDataSet hlhtDataSet){
        return this.hlhtDataSetDao.insertHlhtDataSet(hlhtDataSet);
    }

    public int modifyHlhtDataSet(HlhtDataSet hlhtDataSet){
        return this.hlhtDataSetDao.updateHlhtDataSet(hlhtDataSet);
    }

    public int removeHlhtDataSet(HlhtDataSet hlhtDataSet){
        return this.hlhtDataSetDao.deleteHlhtDataSet(hlhtDataSet);
    }

    public HlhtDataSet getHlhtDataSet(HlhtDataSet hlhtDataSet){
        return this.hlhtDataSetDao.selectHlhtDataSet(hlhtDataSet);
    }

    public int getHlhtDataSetCount(HlhtDataSet hlhtDataSet){
        return (Integer)this.hlhtDataSetDao.selectHlhtDataSetCount(hlhtDataSet);
    }

    public List<HlhtDataSet> getHlhtDataSetList(HlhtDataSet hlhtDataSet){
        return this.hlhtDataSetDao.selectHlhtDataSetList(hlhtDataSet);
    }

    public List<HlhtDataSet> getHlhtDataSetPageList(HlhtDataSet hlhtDataSet){
        return this.hlhtDataSetDao.selectHlhtDataSetPageList(hlhtDataSet);
    }
}