package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtMjzblMjzbl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-29-31 16:29:44
*/
@Repository
public interface HlhtMjzblMjzblDao {

    public int insertHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public int updateHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public int deleteHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public HlhtMjzblMjzbl selectHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public Object selectHlhtMjzblMjzblCount(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public List<HlhtMjzblMjzbl> selectHlhtMjzblMjzblList(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public List<HlhtMjzblMjzbl> selectHlhtMjzblMjzblPageList(HlhtMjzblMjzbl hlhtMjzblMjzbl) throws DataAccessException;

    public HlhtMjzblMjzbl selectInitialHlhtMjzblMjzbl(HlhtMjzblMjzbl entity);

    List<HlhtMjzblMjzbl> selectHlhtMjzblMjzblListByProc(HlhtMjzblMjzbl oneMjzbl);
}