package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlQjjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-33-31 16:33:49
*/
@Repository
public interface HlhtZybcjlQjjlDao {

    public int insertHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public int updateHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public int deleteHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public HlhtZybcjlQjjl selectHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public Object selectHlhtZybcjlQjjlCount(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public List<HlhtZybcjlQjjl> selectHlhtZybcjlQjjlList(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public List<HlhtZybcjlQjjl> selectHlhtZybcjlQjjlPageList(HlhtZybcjlQjjl hlhtZybcjlQjjl) throws DataAccessException;

    public HlhtZybcjlQjjl selectInitialHlhtZybcjlQjjl(HlhtZybcjlQjjl t);

    List<HlhtZybcjlQjjl> selectHlhtZybcjlQjjlListByProc(HlhtZybcjlQjjl oneQjjl);
}