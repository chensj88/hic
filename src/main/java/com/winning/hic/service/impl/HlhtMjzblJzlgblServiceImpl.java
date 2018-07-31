package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtMjzblJzlgblDao;
import com.winning.hic.model.HlhtMjzblJzlgbl;
import com.winning.hic.service.HlhtMjzblJzlgblService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_MJZBL_JZLGBL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:33
*/
@Service
public class HlhtMjzblJzlgblServiceImpl implements  HlhtMjzblJzlgblService {

    @Autowired
    private HlhtMjzblJzlgblDao hlhtMjzblJzlgblDao;

    public int createHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.insertHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public int modifyHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.updateHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public int removeHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.deleteHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public HlhtMjzblJzlgbl getHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public int getHlhtMjzblJzlgblCount(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return (Integer)this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgblCount(hlhtMjzblJzlgbl);
    }

    public List<HlhtMjzblJzlgbl> getHlhtMjzblJzlgblList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgblList(hlhtMjzblJzlgbl);
    }

    public List<HlhtMjzblJzlgbl> getHlhtMjzblJzlgblPageList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgblPageList(hlhtMjzblJzlgbl);
    }
}