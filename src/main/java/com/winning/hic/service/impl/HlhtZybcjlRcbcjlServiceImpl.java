package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlRcbcjlDao;
import com.winning.hic.model.HlhtZybcjlRcbcjl;
import com.winning.hic.service.HlhtZybcjlRcbcjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_RCBCJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:54
*/
@Service
public class HlhtZybcjlRcbcjlServiceImpl implements  HlhtZybcjlRcbcjlService {

    @Autowired
    private HlhtZybcjlRcbcjlDao hlhtZybcjlRcbcjlDao;

    public int createHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return this.hlhtZybcjlRcbcjlDao.insertHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int modifyHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return this.hlhtZybcjlRcbcjlDao.updateHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int removeHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public HlhtZybcjlRcbcjl getHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int getHlhtZybcjlRcbcjlCount(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return (Integer)this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlCount(hlhtZybcjlRcbcjl);
    }

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlList(hlhtZybcjlRcbcjl);
    }

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlPageList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl){
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlPageList(hlhtZybcjlRcbcjl);
    }
}