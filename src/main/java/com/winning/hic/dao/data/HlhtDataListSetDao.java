package com.winning.hic.dao.data;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtDataListSet;



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:05
*/
@Repository
public interface HlhtDataListSetDao {

    public int insertHlhtDataListSet(HlhtDataListSet hlhtDataListSet) throws DataAccessException;

    public int updateHlhtDataListSet(HlhtDataListSet hlhtDataListSet) throws DataAccessException;

    public int deleteHlhtDataListSet(HlhtDataListSet hlhtDataListSet) throws DataAccessException;

    public HlhtDataListSet selectHlhtDataListSet(HlhtDataListSet hlhtDataListSet) throws DataAccessException;

    public Object selectHlhtDataListSetCount(HlhtDataListSet hlhtDataListSet) throws DataAccessException;

    public List<HlhtDataListSet> selectHlhtDataListSetList(HlhtDataListSet hlhtDataListSet) throws DataAccessException;

    public List<HlhtDataListSet> selectHlhtDataListSetPageList(HlhtDataListSet hlhtDataListSet) throws DataAccessException;
}