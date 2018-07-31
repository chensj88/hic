package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZcjlYdfmDao;
import com.winning.hic.model.HlhtZcjlYdfm;
import com.winning.hic.service.HlhtZcjlYdfmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZCJL_YDFM
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-31-31 16:31:19
*/
@Service
public class HlhtZcjlYdfmServiceImpl implements  HlhtZcjlYdfmService {

    @Autowired
    private HlhtZcjlYdfmDao hlhtZcjlYdfmDao;

    public int createHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm){
        return this.hlhtZcjlYdfmDao.insertHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public int modifyHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm){
        return this.hlhtZcjlYdfmDao.updateHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public int removeHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm){
        return this.hlhtZcjlYdfmDao.deleteHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public HlhtZcjlYdfm getHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm){
        return this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfm(hlhtZcjlYdfm);
    }

    public int getHlhtZcjlYdfmCount(HlhtZcjlYdfm hlhtZcjlYdfm){
        return (Integer)this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfmCount(hlhtZcjlYdfm);
    }

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmList(HlhtZcjlYdfm hlhtZcjlYdfm){
        return this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfmList(hlhtZcjlYdfm);
    }

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmPageList(HlhtZcjlYdfm hlhtZcjlYdfm){
        return this.hlhtZcjlYdfmDao.selectHlhtZcjlYdfmPageList(hlhtZcjlYdfm);
    }
}