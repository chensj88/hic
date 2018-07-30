package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDatabasesList;

import com.winning.hic.dao.data.MbzDatabasesListDao;

import com.winning.hic.service.MbzDatabasesListService;


/**
* @author MBZ
* @title 医院远程数据库连接地址配置信息服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-23-25 12:23:49
*/
@Service
public class MbzDatabasesListServiceImpl implements  MbzDatabasesListService {

    @Autowired
    private MbzDatabasesListDao mbzDatabasesListDao;

    public int createMbzDatabasesList(MbzDatabasesList mbzDatabasesList){
        return this.mbzDatabasesListDao.insertMbzDatabasesList(mbzDatabasesList);
    }

    public int modifyMbzDatabasesList(MbzDatabasesList mbzDatabasesList){
        return this.mbzDatabasesListDao.updateMbzDatabasesList(mbzDatabasesList);
    }

    public int removeMbzDatabasesList(MbzDatabasesList mbzDatabasesList){
        return this.mbzDatabasesListDao.deleteMbzDatabasesList(mbzDatabasesList);
    }

    public MbzDatabasesList getMbzDatabasesList(MbzDatabasesList mbzDatabasesList){
        return this.mbzDatabasesListDao.selectMbzDatabasesList(mbzDatabasesList);
    }

    public int getMbzDatabasesListCount(MbzDatabasesList mbzDatabasesList){
        return (Integer)this.mbzDatabasesListDao.selectMbzDatabasesListCount(mbzDatabasesList);
    }

    public List<MbzDatabasesList> getMbzDatabasesListList(MbzDatabasesList mbzDatabasesList){
        return this.mbzDatabasesListDao.selectMbzDatabasesListList(mbzDatabasesList);
    }

    public List<MbzDatabasesList> getMbzDatabasesListPageList(MbzDatabasesList mbzDatabasesList){
        return this.mbzDatabasesListDao.selectMbzDatabasesListPageList(mbzDatabasesList);
    }
}