package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtDatabasesList;  


/**
* @author HLHT
* @title 医院远程数据库连接地址配置信息服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-55-24 13:55:04
*/
public interface HlhtDatabasesListService {

    public int createHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList);

    public int modifyHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList);

    public int removeHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList);

    public HlhtDatabasesList getHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList);

    public int getHlhtDatabasesListCount(HlhtDatabasesList hlhtDatabasesList);

    public List<HlhtDatabasesList> getHlhtDatabasesListList(HlhtDatabasesList hlhtDatabasesList);

    public List<HlhtDatabasesList> getHlhtDatabasesListPageList(HlhtDatabasesList hlhtDatabasesList);
}