package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtRyjlRcyjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-30-31 16:30:31
*/
@Repository
public interface HlhtRyjlRcyjlDao {

    public int insertHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public int updateHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public int deleteHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public HlhtRyjlRcyjl selectHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public Object selectHlhtRyjlRcyjlCount(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public List<HlhtRyjlRcyjl> selectHlhtRyjlRcyjlList(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public List<HlhtRyjlRcyjl> selectHlhtRyjlRcyjlPageList(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;

    public List<HlhtRyjlRcyjl> selectHlhtRyjlRcyjlListByProc(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws DataAccessException;
}