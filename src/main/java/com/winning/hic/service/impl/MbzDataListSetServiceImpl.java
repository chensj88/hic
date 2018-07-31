package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDataListSet;

import com.winning.hic.dao.data.MbzDataListSetDao;

import com.winning.hic.service.MbzDataListSetService;


/**
* @author MBZ
* @title MBZ_DATA_LIST_SET
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:50
*/
@Service
public class MbzDataListSetServiceImpl implements  MbzDataListSetService {

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    public int createMbzDataListSet(MbzDataListSet mbzDataListSet){
        return this.mbzDataListSetDao.insertMbzDataListSet(mbzDataListSet);
    }

    public int modifyMbzDataListSet(MbzDataListSet mbzDataListSet){
        return this.mbzDataListSetDao.updateMbzDataListSet(mbzDataListSet);
    }

    public int removeMbzDataListSet(MbzDataListSet mbzDataListSet){
        return this.mbzDataListSetDao.deleteMbzDataListSet(mbzDataListSet);
    }

    public MbzDataListSet getMbzDataListSet(MbzDataListSet mbzDataListSet){
        return this.mbzDataListSetDao.selectMbzDataListSet(mbzDataListSet);
    }

    public int getMbzDataListSetCount(MbzDataListSet mbzDataListSet){
        return (Integer)this.mbzDataListSetDao.selectMbzDataListSetCount(mbzDataListSet);
    }

    public List<MbzDataListSet> getMbzDataListSetList(MbzDataListSet mbzDataListSet){
        return this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
    }

    public List<MbzDataListSet> getMbzDataListSetPageList(MbzDataListSet mbzDataListSet){
        return this.mbzDataListSetDao.selectMbzDataListSetPageList(mbzDataListSet);
    }

    /**
     * 创建数据，
     * @param mbzDataListSetList
     */
    @Override
    public void createMbzDataListSetForList(List<MbzDataListSet> mbzDataListSetList) {
        MbzDataListSet dataSet = new MbzDataListSet();
        dataSet.setSourceType(mbzDataListSetList.get(0).getSourceType());
        this.mbzDataListSetDao.deleteMbzDataListSet(dataSet);
        for (MbzDataListSet dataListSet : mbzDataListSetList) {
            this.mbzDataListSetDao.insertMbzDataListSet(dataListSet);
        }
    }

    @Override
    public List<String> getMbzDataListSetModelCodeList(MbzDataListSet mbzDataListSet) {
        return null;
    }
}