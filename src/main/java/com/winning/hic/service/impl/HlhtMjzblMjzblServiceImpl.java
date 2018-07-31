package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtMjzblMjzblDao;
import com.winning.hic.model.HlhtMjzblMjzbl;
import com.winning.hic.service.HlhtMjzblMjzblService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_MJZBL_MJZBL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:44
*/
@Service
public class HlhtMjzblMjzblServiceImpl implements  HlhtMjzblMjzblService {

    @Autowired
    private HlhtMjzblMjzblDao hlhtMjzblMjzblDao;

    public int createHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.insertHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public int modifyHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.updateHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public int removeHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.deleteHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public HlhtMjzblMjzbl getHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public int getHlhtMjzblMjzblCount(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return (Integer)this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzblCount(hlhtMjzblMjzbl);
    }

    public List<HlhtMjzblMjzbl> getHlhtMjzblMjzblList(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzblList(hlhtMjzblMjzbl);
    }

    public List<HlhtMjzblMjzbl> getHlhtMjzblMjzblPageList(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzblPageList(hlhtMjzblMjzbl);
    }
}