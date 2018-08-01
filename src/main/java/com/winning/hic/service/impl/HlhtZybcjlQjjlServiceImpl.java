package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlQjjlDao;
import com.winning.hic.model.HlhtZybcjlQjjl;
import com.winning.hic.service.HlhtZybcjlQjjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_QJJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:49
*/
@Service
public class HlhtZybcjlQjjlServiceImpl implements  HlhtZybcjlQjjlService {

    @Autowired
    private HlhtZybcjlQjjlDao hlhtZybcjlQjjlDao;

    public int createHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.insertHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int modifyHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.updateHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int removeHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.deleteHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public HlhtZybcjlQjjl getHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int getHlhtZybcjlQjjlCount(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return (Integer)this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlCount(hlhtZybcjlQjjl);
    }

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlList(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlList(hlhtZybcjlQjjl);
    }

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlPageList(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlPageList(hlhtZybcjlQjjl);
    }
}