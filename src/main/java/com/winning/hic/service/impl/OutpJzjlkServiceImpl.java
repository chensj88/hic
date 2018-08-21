package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.OutpJzjlk;  

import com.winning.hic.dao.cisdb.OutpJzjlkDao;  

import com.winning.hic.service.OutpJzjlkService;  


/**
* @author HLHT
* @title OUTP_JZJLK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-42-21 09:42:04
*/
@Service
public class OutpJzjlkServiceImpl implements  OutpJzjlkService {

    @Autowired
    private OutpJzjlkDao outpJzjlkDao;

    public int createOutpJzjlk(OutpJzjlk outpJzjlk){
        return this.outpJzjlkDao.insertOutpJzjlk(outpJzjlk);
    }

    public int modifyOutpJzjlk(OutpJzjlk outpJzjlk){
        return this.outpJzjlkDao.updateOutpJzjlk(outpJzjlk);
    }

    public int removeOutpJzjlk(OutpJzjlk outpJzjlk){
        return this.outpJzjlkDao.deleteOutpJzjlk(outpJzjlk);
    }

    public OutpJzjlk getOutpJzjlk(OutpJzjlk outpJzjlk){
        return this.outpJzjlkDao.selectOutpJzjlk(outpJzjlk);
    }

    public int getOutpJzjlkCount(OutpJzjlk outpJzjlk){
        return (Integer)this.outpJzjlkDao.selectOutpJzjlkCount(outpJzjlk);
    }

    public List<OutpJzjlk> getOutpJzjlkList(OutpJzjlk outpJzjlk){
        return this.outpJzjlkDao.selectOutpJzjlkList(outpJzjlk);
    }

    public List<OutpJzjlk> getOutpJzjlkPageList(OutpJzjlk outpJzjlk){
        return this.outpJzjlkDao.selectOutpJzjlkPageList(outpJzjlk);
    }
}