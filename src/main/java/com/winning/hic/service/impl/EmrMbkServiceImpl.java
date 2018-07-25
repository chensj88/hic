package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.EmrMxmcmlkDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import com.winning.hic.model.EmrMbk;  

import com.winning.hic.dao.cisdb.EmrMbkDao;

import com.winning.hic.service.EmrMbkService;  


/**
* @author chensj
* @title EMR_MBK
* @email chensj@163.com
* @package com.winning.hic.service.impl
* @date 2018-05-23 09:05:16
*/
@Service
public class EmrMbkServiceImpl implements  EmrMbkService {

    @Autowired
    private EmrMbkDao emrMbkDao;
    @Autowired
    private EmrMxmcmlkDao emrMxmcmlkDao;

    public int createEmrMbk(EmrMbk emrMbk){
        return this.emrMbkDao.insertEmrMbk(emrMbk);
    }

    public int modifyEmrMbk(EmrMbk emrMbk){
        return this.emrMbkDao.updateEmrMbk(emrMbk);
    }

    public int removeEmrMbk(EmrMbk emrMbk){
        return this.emrMbkDao.deleteEmrMbk(emrMbk);
    }

    public EmrMbk getEmrMbk(EmrMbk emrMbk){
        return this.emrMbkDao.selectEmrMbk(emrMbk);
    }

    public int getEmrMbkCount(EmrMbk emrMbk){
        return (Integer)this.emrMbkDao.selectEmrMbkCount(emrMbk);
    }

    public List<EmrMbk> getEmrMbkList(EmrMbk emrMbk){
        return this.emrMbkDao.selectEmrMbkList(emrMbk);
    }

    public List<EmrMbk> getEmrMbkPageList(EmrMbk emrMbk){
        return this.emrMbkDao.selectEmrMbkPageList(emrMbk);
    }
}