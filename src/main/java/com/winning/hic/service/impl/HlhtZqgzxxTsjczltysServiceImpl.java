package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZqgzxxTsjczltysDao;
import com.winning.hic.model.HlhtZqgzxxTsjczltys;
import com.winning.hic.service.HlhtZqgzxxTsjczltysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZQGZXX_TSJCZLTYS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:57
*/
@Service
public class HlhtZqgzxxTsjczltysServiceImpl implements  HlhtZqgzxxTsjczltysService {

    @Autowired
    private HlhtZqgzxxTsjczltysDao hlhtZqgzxxTsjczltysDao;

    public int createHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.insertHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public int modifyHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.updateHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public int removeHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.deleteHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public HlhtZqgzxxTsjczltys getHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public int getHlhtZqgzxxTsjczltysCount(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return (Integer)this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysCount(hlhtZqgzxxTsjczltys);
    }

    public List<HlhtZqgzxxTsjczltys> getHlhtZqgzxxTsjczltysList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysList(hlhtZqgzxxTsjczltys);
    }

    public List<HlhtZqgzxxTsjczltys> getHlhtZqgzxxTsjczltysPageList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysPageList(hlhtZqgzxxTsjczltys);
    }
}