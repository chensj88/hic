package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZlczjlMzshfsjlDao;
import com.winning.hic.model.HlhtZlczjlMzshfsjl;
import com.winning.hic.service.HlhtZlczjlMzshfsjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZLCZJL_MZSHFSJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-31-31 16:31:27
*/
@Service
public class HlhtZlczjlMzshfsjlServiceImpl implements  HlhtZlczjlMzshfsjlService {

    @Autowired
    private HlhtZlczjlMzshfsjlDao hlhtZlczjlMzshfsjlDao;

    public int createHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return this.hlhtZlczjlMzshfsjlDao.insertHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public int modifyHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return this.hlhtZlczjlMzshfsjlDao.updateHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public int removeHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return this.hlhtZlczjlMzshfsjlDao.deleteHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public HlhtZlczjlMzshfsjl getHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjl(hlhtZlczjlMzshfsjl);
    }

    public int getHlhtZlczjlMzshfsjlCount(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return (Integer)this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlCount(hlhtZlczjlMzshfsjl);
    }

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlList(hlhtZlczjlMzshfsjl);
    }

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlPageList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl){
        return this.hlhtZlczjlMzshfsjlDao.selectHlhtZlczjlMzshfsjlPageList(hlhtZlczjlMzshfsjl);
    }
}