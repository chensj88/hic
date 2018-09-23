package com.winning.hic.dao.data;


import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZlczjlMzshfsjl;


import org.springframework.stereotype.Repository;

/**
 * @author HLHT
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-31-31 16:31:27
 */
@Repository
public interface HlhtZlczjlMzshfsjlDao {

    public int insertHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public int updateHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public int deleteHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public HlhtZlczjlMzshfsjl selectHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public Object selectHlhtZlczjlMzshfsjlCount(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public List<HlhtZlczjlMzshfsjl> selectHlhtZlczjlMzshfsjlList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public List<HlhtZlczjlMzshfsjl> selectHlhtZlczjlMzshfsjlPageList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl) throws DataAccessException;

    public void deleteHlhtZlczjlMzshfsjlByYjlxh(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl);

    public List<HlhtZlczjlMzshfsjl> selectHlhtZlczjlMzshfsjlListByProc(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl);

}