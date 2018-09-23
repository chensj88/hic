package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlZkjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-35-31 16:35:02
*/
@Repository
public interface HlhtZybcjlZkjlDao {

    public int insertHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public int updateHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public int deleteHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public HlhtZybcjlZkjl selectHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public Object selectHlhtZybcjlZkjlCount(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public List<HlhtZybcjlZkjl> selectHlhtZybcjlZkjlList(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public List<HlhtZybcjlZkjl> selectHlhtZybcjlZkjlPageList(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    public HlhtZybcjlZkjl selectInitialHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl) throws DataAccessException;

    List<HlhtZybcjlZkjl> selectHlhtZybcjlZkjlListByProc(HlhtZybcjlZkjl oneZkjl) throws DataAccessException;
}