package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlHzjlDao;
import com.winning.hic.model.HlhtZybcjlHzjl;
import com.winning.hic.service.HlhtZybcjlHzjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_HZJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:23
*/
@Service
public class HlhtZybcjlHzjlServiceImpl implements  HlhtZybcjlHzjlService {

    @Autowired
    private HlhtZybcjlHzjlDao hlhtZybcjlHzjlDao;

    public int createHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.insertHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public int modifyHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.updateHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public int removeHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.deleteHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public HlhtZybcjlHzjl getHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public int getHlhtZybcjlHzjlCount(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return (Integer)this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjlCount(hlhtZybcjlHzjl);
    }

    public List<HlhtZybcjlHzjl> getHlhtZybcjlHzjlList(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjlList(hlhtZybcjlHzjl);
    }

    public List<HlhtZybcjlHzjl> getHlhtZybcjlHzjlPageList(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjlPageList(hlhtZybcjlHzjl);
    }
}