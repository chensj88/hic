package com.winning.hic.dao.data;


import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZlczjlSxjl;


import org.springframework.stereotype.Repository;

/**
 * @author HLHT
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-31-31 16:31:46
 */
@Repository
public interface HlhtZlczjlSxjlDao {

    public int insertHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public int updateHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public int deleteHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public HlhtZlczjlSxjl selectHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public Object selectHlhtZlczjlSxjlCount(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public List<HlhtZlczjlSxjl> selectHlhtZlczjlSxjlList(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public List<HlhtZlczjlSxjl> selectHlhtZlczjlSxjlPageList(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

    public void deleteHlhtZlczjlSxjlByYjlxh(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public List<HlhtZlczjlSxjl> selectHlhtZlczjlSxjlListByProc(HlhtZlczjlSxjl hlhtZlczjlSxjl) throws DataAccessException;

}