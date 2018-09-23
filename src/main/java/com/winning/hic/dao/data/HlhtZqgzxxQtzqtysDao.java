package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZqgzxxQtzqtys;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-32-31 16:32:29
*/
@Repository
public interface HlhtZqgzxxQtzqtysDao {

    public int insertHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public int updateHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public int deleteHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public HlhtZqgzxxQtzqtys selectHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public Object selectHlhtZqgzxxQtzqtysCount(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public List<HlhtZqgzxxQtzqtys> selectHlhtZqgzxxQtzqtysList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public List<HlhtZqgzxxQtzqtys> selectHlhtZqgzxxQtzqtysPageList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    public HlhtZqgzxxQtzqtys selectInitialHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) throws DataAccessException;

    List<HlhtZqgzxxQtzqtys> selectHlhtZqgzxxQtzqtysListByProc(HlhtZqgzxxQtzqtys oneQtzqtys);
}