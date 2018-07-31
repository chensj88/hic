package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZzyjlZzyjlDao;
import com.winning.hic.model.HlhtZzyjlZzyjl;
import com.winning.hic.service.HlhtZzyjlZzyjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZZYJL_ZZYJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-35-31 16:35:09
*/
@Service
public class HlhtZzyjlZzyjlServiceImpl implements  HlhtZzyjlZzyjlService {

    @Autowired
    private HlhtZzyjlZzyjlDao hlhtZzyjlZzyjlDao;

    public int createHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return this.hlhtZzyjlZzyjlDao.insertHlhtZzyjlZzyjl(hlhtZzyjlZzyjl);
    }

    public int modifyHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return this.hlhtZzyjlZzyjlDao.updateHlhtZzyjlZzyjl(hlhtZzyjlZzyjl);
    }

    public int removeHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return this.hlhtZzyjlZzyjlDao.deleteHlhtZzyjlZzyjl(hlhtZzyjlZzyjl);
    }

    public HlhtZzyjlZzyjl getHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return this.hlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjl(hlhtZzyjlZzyjl);
    }

    public int getHlhtZzyjlZzyjlCount(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return (Integer)this.hlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjlCount(hlhtZzyjlZzyjl);
    }

    public List<HlhtZzyjlZzyjl> getHlhtZzyjlZzyjlList(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return this.hlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjlList(hlhtZzyjlZzyjl);
    }

    public List<HlhtZzyjlZzyjl> getHlhtZzyjlZzyjlPageList(HlhtZzyjlZzyjl hlhtZzyjlZzyjl){
        return this.hlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjlPageList(hlhtZzyjlZzyjl);
    }
}