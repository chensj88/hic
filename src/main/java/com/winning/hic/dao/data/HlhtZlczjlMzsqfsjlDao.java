package com.winning.hic.dao.data;



import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZlczjlMzsqfsjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-31-31 16:31:37
*/
@Repository
public interface HlhtZlczjlMzsqfsjlDao {

    public int insertHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public int updateHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public int deleteHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public HlhtZlczjlMzsqfsjl selectHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public Object selectHlhtZlczjlMzsqfsjlCount(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public List<HlhtZlczjlMzsqfsjl> selectHlhtZlczjlMzsqfsjlList(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public List<HlhtZlczjlMzsqfsjl> selectHlhtZlczjlMzsqfsjlPageList(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

    public void deleteHlhtZlczjlMzsqfsjlByYjlxh(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public List<HlhtZlczjlMzsqfsjl> selectHlhtZlczjlMzsqfsjlListByProc(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl) throws DataAccessException;

}