package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtBlgyWssjzy;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-29-31 16:29:04
*/
@Repository
public interface HlhtBlgyWssjzyDao {

    public int insertHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public int updateHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public int deleteHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public HlhtBlgyWssjzy selectHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public Object selectHlhtBlgyWssjzyCount(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public List<HlhtBlgyWssjzy> selectHlhtBlgyWssjzyList(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public List<HlhtBlgyWssjzy> selectHlhtBlgyWssjzyPageList(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    public void insertHlhtBlgyWssjzyAll(HlhtBlgyWssjzy hlhtBlgyWssjzy) throws DataAccessException;

    List<HlhtBlgyWssjzy> selectInitHlhtBlgyWssjzyListByProc(HlhtBlgyWssjzy wssjzy) throws DataAccessException;
}