package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.EmrMbmxkDao;
import com.winning.hic.model.EmrMbmxk;
import com.winning.hic.service.EmrMbmxkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title EMR_MBMXK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-11-06 13:11:33
*/
@Service
public class EmrMbmxkServiceImpl implements  EmrMbmxkService {

    @Autowired
    private EmrMbmxkDao emrMbmxkDao;

    public int createEmrMbmxk(EmrMbmxk emrMbmxk){
        return this.emrMbmxkDao.insertEmrMbmxk(emrMbmxk);
    }

    public int modifyEmrMbmxk(EmrMbmxk emrMbmxk){
        return this.emrMbmxkDao.updateEmrMbmxk(emrMbmxk);
    }

    public int removeEmrMbmxk(EmrMbmxk emrMbmxk){
        return this.emrMbmxkDao.deleteEmrMbmxk(emrMbmxk);
    }

    public EmrMbmxk getEmrMbmxk(EmrMbmxk emrMbmxk){
        return this.emrMbmxkDao.selectEmrMbmxk(emrMbmxk);
    }

    public int getEmrMbmxkCount(EmrMbmxk emrMbmxk){
        return (Integer)this.emrMbmxkDao.selectEmrMbmxkCount(emrMbmxk);
    }

    public List<EmrMbmxk> getEmrMbmxkList(EmrMbmxk emrMbmxk){
        return this.emrMbmxkDao.selectEmrMbmxkList(emrMbmxk);
    }

    public List<EmrMbmxk> getEmrMbmxkPageList(EmrMbmxk emrMbmxk){
        return this.emrMbmxkDao.selectEmrMbmxkPageList(emrMbmxk);
    }
}