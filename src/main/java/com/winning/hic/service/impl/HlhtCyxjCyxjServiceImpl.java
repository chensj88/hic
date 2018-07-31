package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtCyxjCyxjDao;
import com.winning.hic.model.HlhtCyxjCyxj;
import com.winning.hic.service.HlhtCyxjCyxjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_CYXJ_CYXJ
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:18
*/
@Service
public class HlhtCyxjCyxjServiceImpl implements  HlhtCyxjCyxjService {

    @Autowired
    private HlhtCyxjCyxjDao hlhtCyxjCyxjDao;

    public int createHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.insertHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public int modifyHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.updateHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public int removeHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.deleteHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public HlhtCyxjCyxj getHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxj(hlhtCyxjCyxj);
    }

    public int getHlhtCyxjCyxjCount(HlhtCyxjCyxj hlhtCyxjCyxj){
        return (Integer)this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxjCount(hlhtCyxjCyxj);
    }

    public List<HlhtCyxjCyxj> getHlhtCyxjCyxjList(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxjList(hlhtCyxjCyxj);
    }

    public List<HlhtCyxjCyxj> getHlhtCyxjCyxjPageList(HlhtCyxjCyxj hlhtCyxjCyxj){
        return this.hlhtCyxjCyxjDao.selectHlhtCyxjCyxjPageList(hlhtCyxjCyxj);
    }
}