package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtRyjlJbxxDao;
import com.winning.hic.model.HlhtRyjlJbxx;
import com.winning.hic.service.HlhtRyjlJbxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_RYJL_JBXX
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:20
*/
@Service
public class HlhtRyjlJbxxServiceImpl implements  HlhtRyjlJbxxService {

    @Autowired
    private HlhtRyjlJbxxDao hlhtRyjlJbxxDao;

    public int createHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx){
         return this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int modifyHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx){
        return this.hlhtRyjlJbxxDao.updateHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int removeHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx){
        return this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public HlhtRyjlJbxx getHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx){
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int getHlhtRyjlJbxxCount(HlhtRyjlJbxx hlhtRyjlJbxx){
        return (Integer)this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxCount(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxList(HlhtRyjlJbxx hlhtRyjlJbxx){
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxList(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxPageList(HlhtRyjlJbxx hlhtRyjlJbxx){
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxPageList(hlhtRyjlJbxx);
    }

    @Override
    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxListFromBaseData() {
        return this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData();
    }
}