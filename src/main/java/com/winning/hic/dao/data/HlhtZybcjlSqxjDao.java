package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlSqxj;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:33
*/
@Repository
public interface HlhtZybcjlSqxjDao {

    public int insertHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public int updateHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public int deleteHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public HlhtZybcjlSqxj selectHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public Object selectHlhtZybcjlSqxjCount(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public List<HlhtZybcjlSqxj> selectHlhtZybcjlSqxjList(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public List<HlhtZybcjlSqxj> selectHlhtZybcjlSqxjPageList(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;

    public List<HlhtZybcjlSqxj> selectHlhtZybcjlSqxjListByProc(HlhtZybcjlSqxj hlhtZybcjlSqxj) throws DataAccessException;
}