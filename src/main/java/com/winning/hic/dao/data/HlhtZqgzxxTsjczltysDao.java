package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZqgzxxTsjczltys;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-32-31 16:32:57
*/
@Repository
public interface HlhtZqgzxxTsjczltysDao {

    public int insertHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public int updateHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public int deleteHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public HlhtZqgzxxTsjczltys selectHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public Object selectHlhtZqgzxxTsjczltysCount(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public List<HlhtZqgzxxTsjczltys> selectHlhtZqgzxxTsjczltysList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public List<HlhtZqgzxxTsjczltys> selectHlhtZqgzxxTsjczltysPageList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;

    public List<HlhtZqgzxxTsjczltys> selectHlhtZqgzxxTsjczltysListByProc(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys) throws DataAccessException;
}