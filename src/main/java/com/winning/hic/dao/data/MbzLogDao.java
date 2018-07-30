package com.winning.hic.dao.data;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzLog;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:08
*/
@Repository
public interface MbzLogDao {

    public int insertMbzLog(MbzLog mbzLog) throws DataAccessException;

    public int updateMbzLog(MbzLog mbzLog) throws DataAccessException;

    public int deleteMbzLog(MbzLog mbzLog) throws DataAccessException;

    public MbzLog selectMbzLog(MbzLog mbzLog) throws DataAccessException;

    public Object selectMbzLogCount(MbzLog mbzLog) throws DataAccessException;

    public List<MbzLog> selectMbzLogList(MbzLog mbzLog) throws DataAccessException;

    public List<MbzLog> selectMbzLogPageList(MbzLog mbzLog) throws DataAccessException;
}