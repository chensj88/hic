package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtMjzblJzlgbl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-29-31 16:29:33
*/
@Repository
public interface HlhtMjzblJzlgblDao {

    public int insertHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    public int updateHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    public int deleteHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    public HlhtMjzblJzlgbl selectHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    public Object selectHlhtMjzblJzlgblCount(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    public List<HlhtMjzblJzlgbl> selectHlhtMjzblJzlgblList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    public List<HlhtMjzblJzlgbl> selectHlhtMjzblJzlgblPageList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws DataAccessException;

    List<HlhtMjzblJzlgbl> selectHlhtMjzblJzlgblListByProc(HlhtMjzblJzlgbl hlht);
}