package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZqgzxxSxzltysDao;
import com.winning.hic.model.HlhtZqgzxxSxzltys;
import com.winning.hic.service.HlhtZqgzxxSxzltysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZQGZXX_SXZLTYS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:49
*/
@Service
public class HlhtZqgzxxSxzltysServiceImpl implements  HlhtZqgzxxSxzltysService {

    @Autowired
    private HlhtZqgzxxSxzltysDao hlhtZqgzxxSxzltysDao;

    public int createHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return this.hlhtZqgzxxSxzltysDao.insertHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public int modifyHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return this.hlhtZqgzxxSxzltysDao.updateHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public int removeHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return this.hlhtZqgzxxSxzltysDao.deleteHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public HlhtZqgzxxSxzltys getHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltys(hlhtZqgzxxSxzltys);
    }

    public int getHlhtZqgzxxSxzltysCount(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return (Integer)this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysCount(hlhtZqgzxxSxzltys);
    }

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysList(hlhtZqgzxxSxzltys);
    }

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysPageList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys){
        return this.hlhtZqgzxxSxzltysDao.selectHlhtZqgzxxSxzltysPageList(hlhtZqgzxxSxzltys);
    }
}