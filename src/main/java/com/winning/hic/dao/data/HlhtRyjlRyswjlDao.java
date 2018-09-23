package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtRyjlRyswjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-30-31 16:30:41
*/
@Repository
public interface HlhtRyjlRyswjlDao {

    public int insertHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public int updateHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public int deleteHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public HlhtRyjlRyswjl selectHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public Object selectHlhtRyjlRyswjlCount(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public List<HlhtRyjlRyswjl> selectHlhtRyjlRyswjlList(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public List<HlhtRyjlRyswjl> selectHlhtRyjlRyswjlPageList(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;

    public List<HlhtRyjlRyswjl> selectHlhtRyjlRyswjlListByProc(HlhtRyjlRyswjl hlhtRyjlRyswjl) throws DataAccessException;
}
