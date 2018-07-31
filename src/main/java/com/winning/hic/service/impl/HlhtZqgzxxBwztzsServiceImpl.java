package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZqgzxxBwztzsDao;
import com.winning.hic.model.HlhtZqgzxxBwztzs;
import com.winning.hic.service.HlhtZqgzxxBwztzsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZQGZXX_BWZTZS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:15
*/
@Service
public class HlhtZqgzxxBwztzsServiceImpl implements  HlhtZqgzxxBwztzsService {

    @Autowired
    private HlhtZqgzxxBwztzsDao hlhtZqgzxxBwztzsDao;

    public int createHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return this.hlhtZqgzxxBwztzsDao.insertHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public int modifyHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return this.hlhtZqgzxxBwztzsDao.updateHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public int removeHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return this.hlhtZqgzxxBwztzsDao.deleteHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public HlhtZqgzxxBwztzs getHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzs(hlhtZqgzxxBwztzs);
    }

    public int getHlhtZqgzxxBwztzsCount(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return (Integer)this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsCount(hlhtZqgzxxBwztzs);
    }

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsList(hlhtZqgzxxBwztzs);
    }

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsPageList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs){
        return this.hlhtZqgzxxBwztzsDao.selectHlhtZqgzxxBwztzsPageList(hlhtZqgzxxBwztzs);
    }
}