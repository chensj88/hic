package com.winning.hic.dao;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtLog;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:08
*/
@Repository
public interface HlhtLogDao {

    public int insertHlhtLog(HlhtLog hlhtLog) throws DataAccessException;

    public int updateHlhtLog(HlhtLog hlhtLog) throws DataAccessException;

    public int deleteHlhtLog(HlhtLog hlhtLog) throws DataAccessException;

    public HlhtLog selectHlhtLog(HlhtLog hlhtLog) throws DataAccessException;

    public Object selectHlhtLogCount(HlhtLog hlhtLog) throws DataAccessException;

    public List<HlhtLog> selectHlhtLogList(HlhtLog hlhtLog) throws DataAccessException;

    public List<HlhtLog> selectHlhtLogPageList(HlhtLog hlhtLog) throws DataAccessException;
}