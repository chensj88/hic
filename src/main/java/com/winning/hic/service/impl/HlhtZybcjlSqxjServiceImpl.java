package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlSqxjDao;
import com.winning.hic.model.HlhtZybcjlSqxj;
import com.winning.hic.service.HlhtZybcjlSqxjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SQXJ
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:33
*/
@Service
public class HlhtZybcjlSqxjServiceImpl implements  HlhtZybcjlSqxjService {

    @Autowired
    private HlhtZybcjlSqxjDao hlhtZybcjlSqxjDao;

    public int createHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return this.hlhtZybcjlSqxjDao.insertHlhtZybcjlSqxj(hlhtZybcjlSqxj);
    }

    public int modifyHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return this.hlhtZybcjlSqxjDao.updateHlhtZybcjlSqxj(hlhtZybcjlSqxj);
    }

    public int removeHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return this.hlhtZybcjlSqxjDao.deleteHlhtZybcjlSqxj(hlhtZybcjlSqxj);
    }

    public HlhtZybcjlSqxj getHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return this.hlhtZybcjlSqxjDao.selectHlhtZybcjlSqxj(hlhtZybcjlSqxj);
    }

    public int getHlhtZybcjlSqxjCount(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return (Integer)this.hlhtZybcjlSqxjDao.selectHlhtZybcjlSqxjCount(hlhtZybcjlSqxj);
    }

    public List<HlhtZybcjlSqxj> getHlhtZybcjlSqxjList(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return this.hlhtZybcjlSqxjDao.selectHlhtZybcjlSqxjList(hlhtZybcjlSqxj);
    }

    public List<HlhtZybcjlSqxj> getHlhtZybcjlSqxjPageList(HlhtZybcjlSqxj hlhtZybcjlSqxj){
        return this.hlhtZybcjlSqxjDao.selectHlhtZybcjlSqxjPageList(hlhtZybcjlSqxj);
    }
}