package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.model.HlhtZybcjlZkjl;
import com.winning.hic.service.HlhtZybcjlZkjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_ZKJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-35-31 16:35:02
*/
@Service
public class HlhtZybcjlZkjlServiceImpl implements  HlhtZybcjlZkjlService {

    @Autowired
    private HlhtZybcjlZkjlDao hlhtZybcjlZkjlDao;

    public int createHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.insertHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int modifyHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.updateHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int removeHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.deleteHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public HlhtZybcjlZkjl getHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int getHlhtZybcjlZkjlCount(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return (Integer)this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlCount(hlhtZybcjlZkjl);
    }

    public List<HlhtZybcjlZkjl> getHlhtZybcjlZkjlList(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlList(hlhtZybcjlZkjl);
    }

    public List<HlhtZybcjlZkjl> getHlhtZybcjlZkjlPageList(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlPageList(hlhtZybcjlZkjl);
    }
}