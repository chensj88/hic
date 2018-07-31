package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtRyjlRcyjlDao;
import com.winning.hic.model.HlhtRyjlRcyjl;
import com.winning.hic.service.HlhtRyjlRcyjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_RYJL_RCYJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:31
*/
@Service
public class HlhtRyjlRcyjlServiceImpl implements  HlhtRyjlRcyjlService {

    @Autowired
    private HlhtRyjlRcyjlDao hlhtRyjlRcyjlDao;

    public int createHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.insertHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public int modifyHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.updateHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public int removeHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.deleteHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public HlhtRyjlRcyjl getHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public int getHlhtRyjlRcyjlCount(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return (Integer)this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjlCount(hlhtRyjlRcyjl);
    }

    public List<HlhtRyjlRcyjl> getHlhtRyjlRcyjlList(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjlList(hlhtRyjlRcyjl);
    }

    public List<HlhtRyjlRcyjl> getHlhtRyjlRcyjlPageList(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjlPageList(hlhtRyjlRcyjl);
    }
}