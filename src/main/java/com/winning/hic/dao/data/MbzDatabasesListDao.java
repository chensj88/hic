package com.winning.hic.dao.data;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzDatabasesList;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title 医院远程数据库连接地址配置信息DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:04
*/
@Repository
public interface MbzDatabasesListDao {

    public int insertMbzDatabasesList(MbzDatabasesList mbzDatabasesList) throws DataAccessException;

    public int updateMbzDatabasesList(MbzDatabasesList mbzDatabasesList) throws DataAccessException;

    public int deleteMbzDatabasesList(MbzDatabasesList mbzDatabasesList) throws DataAccessException;

    public MbzDatabasesList selectMbzDatabasesList(MbzDatabasesList mbzDatabasesList) throws DataAccessException;

    public Object selectMbzDatabasesListCount(MbzDatabasesList mbzDatabasesList) throws DataAccessException;

    public List<MbzDatabasesList> selectMbzDatabasesListList(MbzDatabasesList mbzDatabasesList) throws DataAccessException;

    public List<MbzDatabasesList> selectMbzDatabasesListPageList(MbzDatabasesList mbzDatabasesList) throws DataAccessException;
}