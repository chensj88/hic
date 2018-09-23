package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlShscbcjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:11
*/
@Repository
public interface HlhtZybcjlShscbcjlDao {

    public int insertHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public int updateHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public int deleteHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public HlhtZybcjlShscbcjl selectHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public Object selectHlhtZybcjlShscbcjlCount(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public List<HlhtZybcjlShscbcjl> selectHlhtZybcjlShscbcjlList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public List<HlhtZybcjlShscbcjl> selectHlhtZybcjlShscbcjlPageList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

    public List<HlhtZybcjlShscbcjl> selectHlhtZybcjlShscbcjlListByProc(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl) throws DataAccessException;

}