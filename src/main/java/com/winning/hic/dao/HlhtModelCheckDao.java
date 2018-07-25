package com.winning.hic.dao;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtModelCheck;  



import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:10
*/
@Repository
public interface HlhtModelCheckDao {

    public int insertHlhtModelCheck(HlhtModelCheck hlhtModelCheck) throws DataAccessException;

    public int updateHlhtModelCheck(HlhtModelCheck hlhtModelCheck) throws DataAccessException;

    public int deleteHlhtModelCheck(HlhtModelCheck hlhtModelCheck) throws DataAccessException;

    public HlhtModelCheck selectHlhtModelCheck(HlhtModelCheck hlhtModelCheck) throws DataAccessException;

    public Object selectHlhtModelCheckCount(HlhtModelCheck hlhtModelCheck) throws DataAccessException;

    public List<HlhtModelCheck> selectHlhtModelCheckList(HlhtModelCheck hlhtModelCheck) throws DataAccessException;

    public List<HlhtModelCheck> selectHlhtModelCheckPageList(HlhtModelCheck hlhtModelCheck) throws DataAccessException;
}