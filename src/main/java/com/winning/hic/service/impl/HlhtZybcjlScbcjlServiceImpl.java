package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlScbcjlDao;
import com.winning.hic.model.HlhtZybcjlScbcjl;
import com.winning.hic.service.HlhtZybcjlScbcjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SCBCJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:02
*/
@Service
public class HlhtZybcjlScbcjlServiceImpl implements  HlhtZybcjlScbcjlService {

    @Autowired
    private HlhtZybcjlScbcjlDao hlhtZybcjlScbcjlDao;

    public int createHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.insertHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public int modifyHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.updateHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public int removeHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.deleteHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public HlhtZybcjlScbcjl getHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjl(hlhtZybcjlScbcjl);
    }

    public int getHlhtZybcjlScbcjlCount(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return (Integer)this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjlCount(hlhtZybcjlScbcjl);
    }

    public List<HlhtZybcjlScbcjl> getHlhtZybcjlScbcjlList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjlList(hlhtZybcjlScbcjl);
    }

    public List<HlhtZybcjlScbcjl> getHlhtZybcjlScbcjlPageList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl){
        return this.hlhtZybcjlScbcjlDao.selectHlhtZybcjlScbcjlPageList(hlhtZybcjlScbcjl);
    }
}