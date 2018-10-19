package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlScbcjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:02
*/
@Repository
public interface HlhtZybcjlScbcjlDao {

    public int insertHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public int updateHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public int deleteHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public HlhtZybcjlScbcjl selectHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public Object selectHlhtZybcjlScbcjlCount(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public List<HlhtZybcjlScbcjl> selectHlhtZybcjlScbcjlList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public List<HlhtZybcjlScbcjl> selectHlhtZybcjlScbcjlPageList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl) throws DataAccessException;

    public List<HlhtZybcjlScbcjl> selectHlhtZybcjlScbcjlListByProc(HlhtZybcjlScbcjl t) throws DataAccessException;

    public void selectAllHandleQueryMZ() throws DataAccessException;
    public void selectAllHandleQueryZY() throws DataAccessException;
}