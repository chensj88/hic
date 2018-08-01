package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtRyjlRyswjlDao;
import com.winning.hic.model.HlhtRyjlRyswjl;
import com.winning.hic.service.HlhtRyjlRyswjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_RYJL_RYSWJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:41
*/
@Service
public class HlhtRyjlRyswjlServiceImpl implements  HlhtRyjlRyswjlService {

    @Autowired
    private HlhtRyjlRyswjlDao hlhtRyjlRyswjlDao;

    public int createHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.insertHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int modifyHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.updateHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int removeHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.deleteHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public HlhtRyjlRyswjl getHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int getHlhtRyjlRyswjlCount(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return (Integer)this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlCount(hlhtRyjlRyswjl);
    }

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlList(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlList(hlhtRyjlRyswjl);
    }

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlPageList(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlPageList(hlhtRyjlRyswjl);
    }
}