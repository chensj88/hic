package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlShscbcjlDao;
import com.winning.hic.model.HlhtZybcjlShscbcjl;
import com.winning.hic.service.HlhtZybcjlShscbcjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SHSCBCJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:11
*/
@Service
public class HlhtZybcjlShscbcjlServiceImpl implements  HlhtZybcjlShscbcjlService {

    @Autowired
    private HlhtZybcjlShscbcjlDao hlhtZybcjlShscbcjlDao;

    public int createHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.insertHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int modifyHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.updateHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int removeHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.deleteHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public HlhtZybcjlShscbcjl getHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int getHlhtZybcjlShscbcjlCount(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return (Integer)this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlCount(hlhtZybcjlShscbcjl);
    }

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlList(hlhtZybcjlShscbcjl);
    }

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlPageList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlPageList(hlhtZybcjlShscbcjl);
    }
}