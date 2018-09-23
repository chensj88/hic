package com.winning.hic.dao.data;



import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZlczjlZljl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-32-31 16:32:09
*/
@Repository
public interface HlhtZlczjlZljlDao {

    public int insertHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public int updateHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public int deleteHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public HlhtZlczjlZljl selectHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public Object selectHlhtZlczjlZljlCount(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public List<HlhtZlczjlZljl> selectHlhtZlczjlZljlList(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public List<HlhtZlczjlZljl> selectHlhtZlczjlZljlPageList(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

    public void deleteHlhtZlczjlZljlByYjlxh(HlhtZlczjlZljl hlhtZlczjlZljl);

    public List<HlhtZlczjlZljl> selectHlhtZlczjlZljlListByProc(HlhtZlczjlZljl hlhtZlczjlZljl) throws DataAccessException;

}