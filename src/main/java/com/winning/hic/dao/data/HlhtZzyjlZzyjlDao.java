package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZzyjlZzyjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-35-31 16:35:09
*/
@Repository
public interface HlhtZzyjlZzyjlDao {

    public int insertHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public int updateHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public int deleteHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public HlhtZzyjlZzyjl selectHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public Object selectHlhtZzyjlZzyjlCount(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public List<HlhtZzyjlZzyjl> selectHlhtZzyjlZzyjlList(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public List<HlhtZzyjlZzyjl> selectHlhtZzyjlZzyjlPageList(HlhtZzyjlZzyjl hlhtZzyjlZzyjl) throws DataAccessException;

    public HlhtZzyjlZzyjl selectInitialHlhtZzyjlZzyjl(HlhtZzyjlZzyjl entity);
}