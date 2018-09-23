package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlSwbltljl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:40
*/
@Repository
public interface HlhtZybcjlSwbltljlDao {

    public int insertHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public int updateHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public int deleteHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public HlhtZybcjlSwbltljl selectHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public Object selectHlhtZybcjlSwbltljlCount(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public List<HlhtZybcjlSwbltljl> selectHlhtZybcjlSwbltljlList(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public List<HlhtZybcjlSwbltljl> selectHlhtZybcjlSwbltljlPageList(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;

    public List<HlhtZybcjlSwbltljl> selectHlhtZybcjlSwbltljlListByProc(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl) throws DataAccessException;
}