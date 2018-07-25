package com.winning.hic.dao.data;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtDatabasesList;



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 医院远程数据库连接地址配置信息DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:04
*/
@Repository
public interface HlhtDatabasesListDao {

    public int insertHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;

    public int updateHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;

    public int deleteHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;

    public HlhtDatabasesList selectHlhtDatabasesList(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;

    public Object selectHlhtDatabasesListCount(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;

    public List<HlhtDatabasesList> selectHlhtDatabasesListList(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;

    public List<HlhtDatabasesList> selectHlhtDatabasesListPageList(HlhtDatabasesList hlhtDatabasesList) throws DataAccessException;
}