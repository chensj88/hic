package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlHzjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-33-31 16:33:23
*/
@Repository
public interface HlhtZybcjlHzjlDao {

    public int insertHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public int updateHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public int deleteHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public HlhtZybcjlHzjl selectHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public Object selectHlhtZybcjlHzjlCount(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public List<HlhtZybcjlHzjl> selectHlhtZybcjlHzjlList(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public List<HlhtZybcjlHzjl> selectHlhtZybcjlHzjlPageList(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    public HlhtZybcjlHzjl selectInitialHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl) throws DataAccessException;

    List<HlhtZybcjlHzjl> selecthlhtZybcjlHzjlListByProc(HlhtZybcjlHzjl oneHzjl);

}