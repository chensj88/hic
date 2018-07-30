package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDatabasesList;


/**
* @author MBZ
* @title 医院远程数据库连接地址配置信息服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:49
*/
public interface MbzDatabasesListService {

    public int createMbzDatabasesList(MbzDatabasesList mbzDatabasesList);

    public int modifyMbzDatabasesList(MbzDatabasesList mbzDatabasesList);

    public int removeMbzDatabasesList(MbzDatabasesList mbzDatabasesList);

    public MbzDatabasesList getMbzDatabasesList(MbzDatabasesList mbzDatabasesList);

    public int getMbzDatabasesListCount(MbzDatabasesList mbzDatabasesList);

    public List<MbzDatabasesList> getMbzDatabasesListList(MbzDatabasesList mbzDatabasesList);

    public List<MbzDatabasesList> getMbzDatabasesListPageList(MbzDatabasesList mbzDatabasesList);
}