package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.EmrHzsqdjlkDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.EmrHzsqdjlk;  


import com.winning.hic.service.EmrHzsqdjlkService;  


/**
* @author HLHT
* @title EMR_HZSQDJLK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-03-10 10:03:19
*/
@Service
public class EmrHzsqdjlkServiceImpl implements  EmrHzsqdjlkService {

    @Autowired
    private EmrHzsqdjlkDao emrHzsqdjlkDao;

    public int createEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk){
        return this.emrHzsqdjlkDao.insertEmrHzsqdjlk(emrHzsqdjlk);
    }

    public int modifyEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk){
        return this.emrHzsqdjlkDao.updateEmrHzsqdjlk(emrHzsqdjlk);
    }

    public int removeEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk){
        return this.emrHzsqdjlkDao.deleteEmrHzsqdjlk(emrHzsqdjlk);
    }

    public EmrHzsqdjlk getEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk){
        return this.emrHzsqdjlkDao.selectEmrHzsqdjlk(emrHzsqdjlk);
    }

    public int getEmrHzsqdjlkCount(EmrHzsqdjlk emrHzsqdjlk){
        return (Integer)this.emrHzsqdjlkDao.selectEmrHzsqdjlkCount(emrHzsqdjlk);
    }

    public List<EmrHzsqdjlk> getEmrHzsqdjlkList(EmrHzsqdjlk emrHzsqdjlk){
        return this.emrHzsqdjlkDao.selectEmrHzsqdjlkList(emrHzsqdjlk);
    }

    public List<EmrHzsqdjlk> getEmrHzsqdjlkPageList(EmrHzsqdjlk emrHzsqdjlk){
        return this.emrHzsqdjlkDao.selectEmrHzsqdjlkPageList(emrHzsqdjlk);
    }
}