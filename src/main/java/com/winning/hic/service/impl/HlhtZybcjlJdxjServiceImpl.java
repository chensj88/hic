package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlJdxjDao;
import com.winning.hic.model.HlhtZybcjlJdxj;
import com.winning.hic.service.HlhtZybcjlJdxjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_JDXJ
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:32
*/
@Service
public class HlhtZybcjlJdxjServiceImpl implements  HlhtZybcjlJdxjService {

    @Autowired
    private HlhtZybcjlJdxjDao hlhtZybcjlJdxjDao;

    public int createHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.insertHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int modifyHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.updateHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int removeHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.deleteHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public HlhtZybcjlJdxj getHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int getHlhtZybcjlJdxjCount(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return (Integer)this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjCount(hlhtZybcjlJdxj);
    }

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjList(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjList(hlhtZybcjlJdxj);
    }

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjPageList(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjPageList(hlhtZybcjlJdxj);
    }
}