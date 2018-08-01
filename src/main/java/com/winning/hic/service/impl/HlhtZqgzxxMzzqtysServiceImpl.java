package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZqgzxxMzzqtysDao;
import com.winning.hic.model.HlhtZqgzxxMzzqtys;
import com.winning.hic.service.HlhtZqgzxxMzzqtysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZQGZXX_MZZQTYS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:23
*/
@Service
public class HlhtZqgzxxMzzqtysServiceImpl implements  HlhtZqgzxxMzzqtysService {

    @Autowired
    private HlhtZqgzxxMzzqtysDao hlhtZqgzxxMzzqtysDao;

    public int createHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return this.hlhtZqgzxxMzzqtysDao.insertHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public int modifyHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return this.hlhtZqgzxxMzzqtysDao.updateHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public int removeHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return this.hlhtZqgzxxMzzqtysDao.deleteHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public HlhtZqgzxxMzzqtys getHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtys(hlhtZqgzxxMzzqtys);
    }

    public int getHlhtZqgzxxMzzqtysCount(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return (Integer)this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtysCount(hlhtZqgzxxMzzqtys);
    }

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtysList(hlhtZqgzxxMzzqtys);
    }

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysPageList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys){
        return this.hlhtZqgzxxMzzqtysDao.selectHlhtZqgzxxMzzqtysPageList(hlhtZqgzxxMzzqtys);
    }
}