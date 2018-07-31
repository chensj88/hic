package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlSwjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:47
*/
@Repository
public interface HlhtZybcjlSwjlDao {

    public int insertHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;

    public int updateHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;

    public int deleteHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;

    public HlhtZybcjlSwjl selectHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;

    public Object selectHlhtZybcjlSwjlCount(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;

    public List<HlhtZybcjlSwjl> selectHlhtZybcjlSwjlList(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;

    public List<HlhtZybcjlSwjl> selectHlhtZybcjlSwjlPageList(HlhtZybcjlSwjl hlhtZybcjlSwjl) throws DataAccessException;
}