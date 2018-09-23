package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlSqtl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:26
*/
@Repository
public interface HlhtZybcjlSqtlDao {

    public int insertHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public int updateHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public int deleteHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public HlhtZybcjlSqtl selectHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public Object selectHlhtZybcjlSqtlCount(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public List<HlhtZybcjlSqtl> selectHlhtZybcjlSqtlList(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public List<HlhtZybcjlSqtl> selectHlhtZybcjlSqtlPageList(HlhtZybcjlSqtl hlhtZybcjlSqtl) throws DataAccessException;

    public List<HlhtZybcjlSqtl> selectHlhtZybcjlSqtlListByProc(HlhtZybcjlSqtl hlht);
}