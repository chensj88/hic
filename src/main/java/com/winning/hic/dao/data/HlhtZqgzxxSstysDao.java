package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZqgzxxSstys;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-32-31 16:32:38
*/
@Repository
public interface HlhtZqgzxxSstysDao {

    public int insertHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    public int updateHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    public int deleteHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    public HlhtZqgzxxSstys selectHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    public Object selectHlhtZqgzxxSstysCount(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    public List<HlhtZqgzxxSstys> selectHlhtZqgzxxSstysList(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    public List<HlhtZqgzxxSstys> selectHlhtZqgzxxSstysPageList(HlhtZqgzxxSstys hlhtZqgzxxSstys) throws DataAccessException;

    List<HlhtZqgzxxSstys> selectHlhtZqgzxxSstysListByProc(HlhtZqgzxxSstys hlht);
}