package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtBlgyJbjkxx;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-28-31 16:28:56
*/
@Repository
public interface HlhtBlgyJbjkxxDao {

    public int insertHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    public int updateHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    public int deleteHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    public HlhtBlgyJbjkxx selectHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    public Object selectHlhtBlgyJbjkxxCount(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    public List<HlhtBlgyJbjkxx> selectHlhtBlgyJbjkxxList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    public List<HlhtBlgyJbjkxx> selectHlhtBlgyJbjkxxPageList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx) throws DataAccessException;

    List<HlhtBlgyJbjkxx> selectHlhtBlgyJbjkxxListByProc(HlhtBlgyJbjkxx jbjkxx);
}