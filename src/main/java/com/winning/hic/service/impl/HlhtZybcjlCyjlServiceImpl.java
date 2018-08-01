package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlCyjlDao;
import com.winning.hic.model.HlhtZybcjlCyjl;
import com.winning.hic.service.HlhtZybcjlCyjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_CYJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:08
*/
@Service
public class HlhtZybcjlCyjlServiceImpl implements  HlhtZybcjlCyjlService {

    @Autowired
    private HlhtZybcjlCyjlDao hlhtZybcjlCyjlDao;

    public int createHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return this.hlhtZybcjlCyjlDao.insertHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int modifyHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return this.hlhtZybcjlCyjlDao.updateHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int removeHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public HlhtZybcjlCyjl getHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int getHlhtZybcjlCyjlCount(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return (Integer)this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlCount(hlhtZybcjlCyjl);
    }

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlList(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlList(hlhtZybcjlCyjl);
    }

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlPageList(HlhtZybcjlCyjl hlhtZybcjlCyjl){
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlPageList(hlhtZybcjlCyjl);
    }
}