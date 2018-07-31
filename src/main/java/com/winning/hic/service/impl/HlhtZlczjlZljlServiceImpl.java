package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZlczjlZljlDao;
import com.winning.hic.model.HlhtZlczjlZljl;
import com.winning.hic.service.HlhtZlczjlZljlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZLCZJL_ZLJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:09
*/
@Service
public class HlhtZlczjlZljlServiceImpl implements  HlhtZlczjlZljlService {

    @Autowired
    private HlhtZlczjlZljlDao hlhtZlczjlZljlDao;

    public int createHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl){
        return this.hlhtZlczjlZljlDao.insertHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public int modifyHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl){
        return this.hlhtZlczjlZljlDao.updateHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public int removeHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl){
        return this.hlhtZlczjlZljlDao.deleteHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public HlhtZlczjlZljl getHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl){
        return this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljl(hlhtZlczjlZljl);
    }

    public int getHlhtZlczjlZljlCount(HlhtZlczjlZljl hlhtZlczjlZljl){
        return (Integer)this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljlCount(hlhtZlczjlZljl);
    }

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlList(HlhtZlczjlZljl hlhtZlczjlZljl){
        return this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljlList(hlhtZlczjlZljl);
    }

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlPageList(HlhtZlczjlZljl hlhtZlczjlZljl){
        return this.hlhtZlczjlZljlDao.selectHlhtZlczjlZljlPageList(hlhtZlczjlZljl);
    }
}