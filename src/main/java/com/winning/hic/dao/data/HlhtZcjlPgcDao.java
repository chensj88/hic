package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZcjlPgc;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-30-31 16:30:59
*/
@Repository
public interface HlhtZcjlPgcDao {

    public int insertHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public int updateHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public int deleteHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public HlhtZcjlPgc selectHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public Object selectHlhtZcjlPgcCount(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public List<HlhtZcjlPgc> selectHlhtZcjlPgcList(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public List<HlhtZcjlPgc> selectHlhtZcjlPgcPageList(HlhtZcjlPgc hlhtZcjlPgc) throws DataAccessException;

    public HlhtZcjlPgc selectInitialHlhtZcjlPgc(HlhtZcjlPgc entity);

    List<HlhtZcjlPgc> selectHlhtZcjlPgcListByProc(HlhtZcjlPgc onePgc) throws DataAccessException;;
}