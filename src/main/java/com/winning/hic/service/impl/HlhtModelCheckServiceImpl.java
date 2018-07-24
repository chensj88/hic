package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtModelCheck;  

import com.winning.hic.dao.HlhtModelCheckDao;  

import com.winning.hic.service.HlhtModelCheckService;  


/**
* @author HLHT
* @title HLHT_MODEL_CHECK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-55-24 13:55:10
*/
@Service
public class HlhtModelCheckServiceImpl implements  HlhtModelCheckService {

    @Autowired
    private HlhtModelCheckDao hlhtModelCheckDao;

    public int createHlhtModelCheck(HlhtModelCheck hlhtModelCheck){
        return this.hlhtModelCheckDao.insertHlhtModelCheck(hlhtModelCheck);
    }

    public int modifyHlhtModelCheck(HlhtModelCheck hlhtModelCheck){
        return this.hlhtModelCheckDao.updateHlhtModelCheck(hlhtModelCheck);
    }

    public int removeHlhtModelCheck(HlhtModelCheck hlhtModelCheck){
        return this.hlhtModelCheckDao.deleteHlhtModelCheck(hlhtModelCheck);
    }

    public HlhtModelCheck getHlhtModelCheck(HlhtModelCheck hlhtModelCheck){
        return this.hlhtModelCheckDao.selectHlhtModelCheck(hlhtModelCheck);
    }

    public int getHlhtModelCheckCount(HlhtModelCheck hlhtModelCheck){
        return (Integer)this.hlhtModelCheckDao.selectHlhtModelCheckCount(hlhtModelCheck);
    }

    public List<HlhtModelCheck> getHlhtModelCheckList(HlhtModelCheck hlhtModelCheck){
        return this.hlhtModelCheckDao.selectHlhtModelCheckList(hlhtModelCheck);
    }

    public List<HlhtModelCheck> getHlhtModelCheckPageList(HlhtModelCheck hlhtModelCheck){
        return this.hlhtModelCheckDao.selectHlhtModelCheckPageList(hlhtModelCheck);
    }
}