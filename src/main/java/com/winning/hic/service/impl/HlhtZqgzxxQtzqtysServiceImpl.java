package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZqgzxxQtzqtysDao;
import com.winning.hic.model.HlhtZqgzxxQtzqtys;
import com.winning.hic.service.HlhtZqgzxxQtzqtysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZQGZXX_QTZQTYS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:29
*/
@Service
public class HlhtZqgzxxQtzqtysServiceImpl implements  HlhtZqgzxxQtzqtysService {

    @Autowired
    private HlhtZqgzxxQtzqtysDao hlhtZqgzxxQtzqtysDao;

    public int createHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.insertHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public int modifyHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.updateHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public int removeHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.deleteHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public HlhtZqgzxxQtzqtys getHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public int getHlhtZqgzxxQtzqtysCount(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return (Integer)this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysCount(hlhtZqgzxxQtzqtys);
    }

    public List<HlhtZqgzxxQtzqtys> getHlhtZqgzxxQtzqtysList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysList(hlhtZqgzxxQtzqtys);
    }

    public List<HlhtZqgzxxQtzqtys> getHlhtZqgzxxQtzqtysPageList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysPageList(hlhtZqgzxxQtzqtys);
    }
}