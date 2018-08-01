package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZlczjlMzsqfsjlDao;
import com.winning.hic.model.HlhtZlczjlMzsqfsjl;
import com.winning.hic.service.HlhtZlczjlMzsqfsjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZLCZJL_MZSQFSJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-31-31 16:31:37
*/
@Service
public class HlhtZlczjlMzsqfsjlServiceImpl implements  HlhtZlczjlMzsqfsjlService {

    @Autowired
    private HlhtZlczjlMzsqfsjlDao hlhtZlczjlMzsqfsjlDao;

    public int createHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return this.hlhtZlczjlMzsqfsjlDao.insertHlhtZlczjlMzsqfsjl(hlhtZlczjlMzsqfsjl);
    }

    public int modifyHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return this.hlhtZlczjlMzsqfsjlDao.updateHlhtZlczjlMzsqfsjl(hlhtZlczjlMzsqfsjl);
    }

    public int removeHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return this.hlhtZlczjlMzsqfsjlDao.deleteHlhtZlczjlMzsqfsjl(hlhtZlczjlMzsqfsjl);
    }

    public HlhtZlczjlMzsqfsjl getHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return this.hlhtZlczjlMzsqfsjlDao.selectHlhtZlczjlMzsqfsjl(hlhtZlczjlMzsqfsjl);
    }

    public int getHlhtZlczjlMzsqfsjlCount(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return (Integer)this.hlhtZlczjlMzsqfsjlDao.selectHlhtZlczjlMzsqfsjlCount(hlhtZlczjlMzsqfsjl);
    }

    public List<HlhtZlczjlMzsqfsjl> getHlhtZlczjlMzsqfsjlList(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return this.hlhtZlczjlMzsqfsjlDao.selectHlhtZlczjlMzsqfsjlList(hlhtZlczjlMzsqfsjl);
    }

    public List<HlhtZlczjlMzsqfsjl> getHlhtZlczjlMzsqfsjlPageList(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl){
        return this.hlhtZlczjlMzsqfsjlDao.selectHlhtZlczjlMzsqfsjlPageList(hlhtZlczjlMzsqfsjl);
    }
}