package com.winning.hic.dao.data;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtDataCheck;



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:05
*/
@Repository
public interface HlhtDataCheckDao {

    public int insertHlhtDataCheck(HlhtDataCheck hlhtDataCheck) throws DataAccessException;

    public int updateHlhtDataCheck(HlhtDataCheck hlhtDataCheck) throws DataAccessException;

    public int deleteHlhtDataCheck(HlhtDataCheck hlhtDataCheck) throws DataAccessException;

    public HlhtDataCheck selectHlhtDataCheck(HlhtDataCheck hlhtDataCheck) throws DataAccessException;

    public Object selectHlhtDataCheckCount(HlhtDataCheck hlhtDataCheck) throws DataAccessException;

    public List<HlhtDataCheck> selectHlhtDataCheckList(HlhtDataCheck hlhtDataCheck) throws DataAccessException;

    public List<HlhtDataCheck> selectHlhtDataCheckPageList(HlhtDataCheck hlhtDataCheck) throws DataAccessException;
}