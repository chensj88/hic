package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlJdxj;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-33-31 16:33:32
*/
@Repository
public interface HlhtZybcjlJdxjDao {

    public int insertHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public int updateHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public int deleteHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public HlhtZybcjlJdxj selectHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public Object selectHlhtZybcjlJdxjCount(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public List<HlhtZybcjlJdxj> selectHlhtZybcjlJdxjList(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public List<HlhtZybcjlJdxj> selectHlhtZybcjlJdxjPageList(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    public HlhtZybcjlJdxj selectInitialHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj) throws DataAccessException;

    List<HlhtZybcjlJdxj> selectHlhtZybcjlJdxjListByProc(HlhtZybcjlJdxj jdxj) throws DataAccessException;
}