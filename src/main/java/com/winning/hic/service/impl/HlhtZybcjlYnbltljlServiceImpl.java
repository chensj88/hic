package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlYnbltljlDao;
import com.winning.hic.model.HlhtZybcjlYnbltljl;
import com.winning.hic.service.HlhtZybcjlYnbltljlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_YNBLTLJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:53
*/
@Service
public class HlhtZybcjlYnbltljlServiceImpl implements  HlhtZybcjlYnbltljlService {

    @Autowired
    private HlhtZybcjlYnbltljlDao hlhtZybcjlYnbltljlDao;

    public int createHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return this.hlhtZybcjlYnbltljlDao.insertHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int modifyHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return this.hlhtZybcjlYnbltljlDao.updateHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int removeHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public HlhtZybcjlYnbltljl getHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int getHlhtZybcjlYnbltljlCount(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return (Integer)this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlCount(hlhtZybcjlYnbltljl);
    }

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlList(hlhtZybcjlYnbltljl);
    }

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlPageList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl){
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlPageList(hlhtZybcjlYnbltljl);
    }
}