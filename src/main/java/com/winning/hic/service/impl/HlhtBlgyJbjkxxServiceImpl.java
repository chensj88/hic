package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtBlgyJbjkxxDao;
import com.winning.hic.model.HlhtBlgyJbjkxx;
import com.winning.hic.service.HlhtBlgyJbjkxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_BLGY_JBJKXX
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-28-31 16:28:56
*/
@Service
public class HlhtBlgyJbjkxxServiceImpl implements  HlhtBlgyJbjkxxService {

    @Autowired
    private HlhtBlgyJbjkxxDao hlhtBlgyJbjkxxDao;

    public int createHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.insertHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public int modifyHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.updateHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public int removeHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.deleteHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public HlhtBlgyJbjkxx getHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public int getHlhtBlgyJbjkxxCount(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return (Integer)this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxxCount(hlhtBlgyJbjkxx);
    }

    public List<HlhtBlgyJbjkxx> getHlhtBlgyJbjkxxList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxxList(hlhtBlgyJbjkxx);
    }

    public List<HlhtBlgyJbjkxx> getHlhtBlgyJbjkxxPageList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxxPageList(hlhtBlgyJbjkxx);
    }
}