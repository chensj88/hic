package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZqgzxxSstysDao;
import com.winning.hic.model.HlhtZqgzxxSstys;
import com.winning.hic.service.HlhtZqgzxxSstysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZQGZXX_SSTYS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:38
*/
@Service
public class HlhtZqgzxxSstysServiceImpl implements  HlhtZqgzxxSstysService {

    @Autowired
    private HlhtZqgzxxSstysDao hlhtZqgzxxSstysDao;

    public int createHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return this.hlhtZqgzxxSstysDao.insertHlhtZqgzxxSstys(hlhtZqgzxxSstys);
    }

    public int modifyHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return this.hlhtZqgzxxSstysDao.updateHlhtZqgzxxSstys(hlhtZqgzxxSstys);
    }

    public int removeHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return this.hlhtZqgzxxSstysDao.deleteHlhtZqgzxxSstys(hlhtZqgzxxSstys);
    }

    public HlhtZqgzxxSstys getHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return this.hlhtZqgzxxSstysDao.selectHlhtZqgzxxSstys(hlhtZqgzxxSstys);
    }

    public int getHlhtZqgzxxSstysCount(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return (Integer)this.hlhtZqgzxxSstysDao.selectHlhtZqgzxxSstysCount(hlhtZqgzxxSstys);
    }

    public List<HlhtZqgzxxSstys> getHlhtZqgzxxSstysList(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return this.hlhtZqgzxxSstysDao.selectHlhtZqgzxxSstysList(hlhtZqgzxxSstys);
    }

    public List<HlhtZqgzxxSstys> getHlhtZqgzxxSstysPageList(HlhtZqgzxxSstys hlhtZqgzxxSstys){
        return this.hlhtZqgzxxSstysDao.selectHlhtZqgzxxSstysPageList(hlhtZqgzxxSstys);
    }
}