package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlSwbltljlDao;
import com.winning.hic.model.HlhtZybcjlSwbltljl;
import com.winning.hic.service.HlhtZybcjlSwbltljlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SWBLTLJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:40
*/
@Service
public class HlhtZybcjlSwbltljlServiceImpl implements  HlhtZybcjlSwbltljlService {

    @Autowired
    private HlhtZybcjlSwbltljlDao hlhtZybcjlSwbltljlDao;

    public int createHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.insertHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public int modifyHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.updateHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public int removeHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.deleteHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public HlhtZybcjlSwbltljl getHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public int getHlhtZybcjlSwbltljlCount(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return (Integer)this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljlCount(hlhtZybcjlSwbltljl);
    }

    public List<HlhtZybcjlSwbltljl> getHlhtZybcjlSwbltljlList(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljlList(hlhtZybcjlSwbltljl);
    }

    public List<HlhtZybcjlSwbltljl> getHlhtZybcjlSwbltljlPageList(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljlPageList(hlhtZybcjlSwbltljl);
    }
}