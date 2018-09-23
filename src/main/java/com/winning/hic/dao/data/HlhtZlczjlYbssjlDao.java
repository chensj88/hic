package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZlczjlYbssjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-31-31 16:31:59
*/
@Repository
public interface HlhtZlczjlYbssjlDao {

    public int insertHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public int updateHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public int deleteHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public HlhtZlczjlYbssjl selectHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public Object selectHlhtZlczjlYbssjlCount(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public List<HlhtZlczjlYbssjl> selectHlhtZlczjlYbssjlList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public List<HlhtZlczjlYbssjl> selectHlhtZlczjlYbssjlPageList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public HlhtZlczjlYbssjl selectInitialHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl) throws DataAccessException;

    public List<HlhtZlczjlYbssjl> selectHlhtZlczjlYbssjlListByProc(HlhtZlczjlYbssjl oneYbssjl) throws DataAccessException;
}