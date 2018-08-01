package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZqgzxxMzzqtys;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-32-31 16:32:23
*/
@Repository
public interface HlhtZqgzxxMzzqtysDao {

    public int insertHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;

    public int updateHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;

    public int deleteHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;

    public HlhtZqgzxxMzzqtys selectHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;

    public Object selectHlhtZqgzxxMzzqtysCount(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;

    public List<HlhtZqgzxxMzzqtys> selectHlhtZqgzxxMzzqtysList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;

    public List<HlhtZqgzxxMzzqtys> selectHlhtZqgzxxMzzqtysPageList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys) throws DataAccessException;
}