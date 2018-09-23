package com.winning.hic.dao.data;


import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZqgzxxBwztzs;


import org.springframework.stereotype.Repository;

/**
 * @author HLHT
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-32-31 16:32:15
 */
@Repository
public interface HlhtZqgzxxBwztzsDao {

    public int insertHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public int updateHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public int deleteHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public HlhtZqgzxxBwztzs selectHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public Object selectHlhtZqgzxxBwztzsCount(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public List<HlhtZqgzxxBwztzs> selectHlhtZqgzxxBwztzsList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public List<HlhtZqgzxxBwztzs> selectHlhtZqgzxxBwztzsPageList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

    public void deleteHlhtZqgzxxBwztzsByYjlxh(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public List<HlhtZqgzxxBwztzs> selectHlhtZqgzxxBwztzsListByProc(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs) throws DataAccessException;

}