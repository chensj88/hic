package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZlczjlSxjlDao;
import com.winning.hic.model.HlhtZlczjlSxjl;
import com.winning.hic.service.HlhtZlczjlSxjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZLCZJL_SXJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-31-31 16:31:46
*/
@Service
public class HlhtZlczjlSxjlServiceImpl implements  HlhtZlczjlSxjlService {

    @Autowired
    private HlhtZlczjlSxjlDao hlhtZlczjlSxjlDao;

    public int createHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return this.hlhtZlczjlSxjlDao.insertHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public int modifyHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return this.hlhtZlczjlSxjlDao.updateHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public int removeHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return this.hlhtZlczjlSxjlDao.deleteHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public HlhtZlczjlSxjl getHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjl(hlhtZlczjlSxjl);
    }

    public int getHlhtZlczjlSxjlCount(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return (Integer)this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlCount(hlhtZlczjlSxjl);
    }

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlList(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlList(hlhtZlczjlSxjl);
    }

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlPageList(HlhtZlczjlSxjl hlhtZlczjlSxjl){
        return this.hlhtZlczjlSxjlDao.selectHlhtZlczjlSxjlPageList(hlhtZlczjlSxjl);
    }
}