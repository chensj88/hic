package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlCyjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-33-31 16:33:08
*/
@Repository
public interface HlhtZybcjlCyjlDao {

    public int insertHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;

    public int updateHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;

    public int deleteHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;

    public HlhtZybcjlCyjl selectHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;

    public Object selectHlhtZybcjlCyjlCount(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;

    public List<HlhtZybcjlCyjl> selectHlhtZybcjlCyjlList(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;

    public List<HlhtZybcjlCyjl> selectHlhtZybcjlCyjlPageList(HlhtZybcjlCyjl hlhtZybcjlCyjl) throws DataAccessException;
}