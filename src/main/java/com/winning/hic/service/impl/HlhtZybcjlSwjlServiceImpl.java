package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlSwjlDao;
import com.winning.hic.model.HlhtZybcjlSwjl;
import com.winning.hic.service.HlhtZybcjlSwjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SWJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:47
*/
@Service
public class HlhtZybcjlSwjlServiceImpl implements  HlhtZybcjlSwjlService {

    @Autowired
    private HlhtZybcjlSwjlDao hlhtZybcjlSwjlDao;

    public int createHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return this.hlhtZybcjlSwjlDao.insertHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public int modifyHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return this.hlhtZybcjlSwjlDao.updateHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public int removeHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return this.hlhtZybcjlSwjlDao.deleteHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public HlhtZybcjlSwjl getHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjl(hlhtZybcjlSwjl);
    }

    public int getHlhtZybcjlSwjlCount(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return (Integer)this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlCount(hlhtZybcjlSwjl);
    }

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlList(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlList(hlhtZybcjlSwjl);
    }

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlPageList(HlhtZybcjlSwjl hlhtZybcjlSwjl){
        return this.hlhtZybcjlSwjlDao.selectHlhtZybcjlSwjlPageList(hlhtZybcjlSwjl);
    }
}