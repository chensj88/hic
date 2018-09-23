package com.winning.hic.dao.data;


import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZqgzxxSxzltys;


import org.springframework.stereotype.Repository;

/**
 * @author HLHT
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-32-31 16:32:49
 */
@Repository
public interface HlhtZqgzxxSxzltysDao {

    public int insertHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public int updateHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public int deleteHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public HlhtZqgzxxSxzltys selectHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public Object selectHlhtZqgzxxSxzltysCount(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public List<HlhtZqgzxxSxzltys> selectHlhtZqgzxxSxzltysList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public List<HlhtZqgzxxSxzltys> selectHlhtZqgzxxSxzltysPageList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

    public void deleteHlhtZqgzxxSxzltysByYjlxh(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public List<HlhtZqgzxxSxzltys> selectHlhtZqgzxxSxzltysListByProc(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys) throws DataAccessException;

}