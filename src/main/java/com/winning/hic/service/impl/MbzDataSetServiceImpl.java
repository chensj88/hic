package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDataSet;

import com.winning.hic.dao.data.MbzDataSetDao;

import com.winning.hic.service.MbzDataSetService;


/**
* @author HLHT
* @title 基础数据配置表服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-24-26 09:24:07
*/
@Service
public class MbzDataSetServiceImpl implements  MbzDataSetService {

    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    public int createMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.insertMbzDataSet(mbzDataSet);
    }

    public int modifyMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.updateMbzDataSet(mbzDataSet);
    }

    public int removeMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.deleteMbzDataSet(mbzDataSet);
    }

    public MbzDataSet getMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.selectMbzDataSet(mbzDataSet);
    }

    public int getMbzDataSetCount(MbzDataSet mbzDataSet){
        return (Integer)this.mbzDataSetDao.selectMbzDataSetCount(mbzDataSet);
    }

    public List<MbzDataSet> getMbzDataSetList(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
    }

    public List<MbzDataSet> getMbzDataSetPageList(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.selectMbzDataSetPageList(mbzDataSet);
    }
}