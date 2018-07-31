package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZlczjlYbssjlDao;
import com.winning.hic.model.HlhtZlczjlYbssjl;
import com.winning.hic.service.HlhtZlczjlYbssjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZLCZJL_YBSSJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-31-31 16:31:59
*/
@Service
public class HlhtZlczjlYbssjlServiceImpl implements  HlhtZlczjlYbssjlService {

    @Autowired
    private HlhtZlczjlYbssjlDao hlhtZlczjlYbssjlDao;

    public int createHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.insertHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public int modifyHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.updateHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public int removeHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.deleteHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public HlhtZlczjlYbssjl getHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public int getHlhtZlczjlYbssjlCount(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return (Integer)this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjlCount(hlhtZlczjlYbssjl);
    }

    public List<HlhtZlczjlYbssjl> getHlhtZlczjlYbssjlList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjlList(hlhtZlczjlYbssjl);
    }

    public List<HlhtZlczjlYbssjl> getHlhtZlczjlYbssjlPageList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjlPageList(hlhtZlczjlYbssjl);
    }
}