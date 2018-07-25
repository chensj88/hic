package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtDatabasesList;  

import com.winning.hic.dao.data.HlhtDatabasesListDao;  

import com.winning.hic.service.HlhtDatabasesListService;  


/**
* @author HLHT
* @title 医院远程数据库连接地址配置信息服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:49
*/
@Service
public class HlhtDatabasesListServiceImpl implements  HlhtDatabasesListService {

    @Autowired
    private HlhtDatabasesListDao hlhtDatabasesListDao;

    public int createHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList){
        return this.hlhtDatabasesListDao.insertHlhtDatabasesList(hlhtDatabasesList);
    }

    public int modifyHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList){
        return this.hlhtDatabasesListDao.updateHlhtDatabasesList(hlhtDatabasesList);
    }

    public int removeHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList){
        return this.hlhtDatabasesListDao.deleteHlhtDatabasesList(hlhtDatabasesList);
    }

    public HlhtDatabasesList getHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList){
        return this.hlhtDatabasesListDao.selectHlhtDatabasesList(hlhtDatabasesList);
    }

    public int getHlhtDatabasesListCount(HlhtDatabasesList hlhtDatabasesList){
        return (Integer)this.hlhtDatabasesListDao.selectHlhtDatabasesListCount(hlhtDatabasesList);
    }

    public List<HlhtDatabasesList> getHlhtDatabasesListList(HlhtDatabasesList hlhtDatabasesList){
        return this.hlhtDatabasesListDao.selectHlhtDatabasesListList(hlhtDatabasesList);
    }

    public List<HlhtDatabasesList> getHlhtDatabasesListPageList(HlhtDatabasesList hlhtDatabasesList){
        return this.hlhtDatabasesListDao.selectHlhtDatabasesListPageList(hlhtDatabasesList);
    }
}