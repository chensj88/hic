package com.winning.hic.dao.data;


import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtRyjlJbxx;


import org.springframework.stereotype.Repository;

/**
 * @author HLHT
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-30-31 16:30:20
 */
@Repository
public interface HlhtRyjlJbxxDao {

    public int insertHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public int updateHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public int deleteHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public HlhtRyjlJbxx selectHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public Object selectHlhtRyjlJbxxCount(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public List<HlhtRyjlJbxx> selectHlhtRyjlJbxxList(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public List<HlhtRyjlJbxx> selectHlhtRyjlJbxxPageList(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;

    public void deleteHlhtRyjlJbxxByYjlxh(HlhtRyjlJbxx hlhtRyjlJbxx);

    public List<HlhtRyjlJbxx> selectHlhtRyjlJbxxListByProc(HlhtRyjlJbxx hlhtRyjlJbxx) throws DataAccessException;
}