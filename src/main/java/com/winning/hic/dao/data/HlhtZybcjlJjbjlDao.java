package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlJjbjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-33-31 16:33:41
*/
@Repository
public interface HlhtZybcjlJjbjlDao {

    public int insertHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public int updateHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public int deleteHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public HlhtZybcjlJjbjl selectHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public Object selectHlhtZybcjlJjbjlCount(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public List<HlhtZybcjlJjbjl> selectHlhtZybcjlJjbjlList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public List<HlhtZybcjlJjbjl> selectHlhtZybcjlJjbjlPageList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;

    public HlhtZybcjlJjbjl selectInitialHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl) throws DataAccessException;


    List<HlhtZybcjlJjbjl> selectHlhtZybcjlJjbjlListByProc(HlhtZybcjlJjbjl oneJjbjl);
}