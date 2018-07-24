package com.winning.hic.dao;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtDataSet;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 基础数据配置表DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:07
*/
@Repository
public interface HlhtDataSetDao {

    public int insertHlhtDataSet(HlhtDataSet hlhtDataSet) throws DataAccessException;

    public int updateHlhtDataSet(HlhtDataSet hlhtDataSet) throws DataAccessException;

    public int deleteHlhtDataSet(HlhtDataSet hlhtDataSet) throws DataAccessException;

    public HlhtDataSet selectHlhtDataSet(HlhtDataSet hlhtDataSet) throws DataAccessException;

    public Object selectHlhtDataSetCount(HlhtDataSet hlhtDataSet) throws DataAccessException;

    public List<HlhtDataSet> selectHlhtDataSetList(HlhtDataSet hlhtDataSet) throws DataAccessException;

    public List<HlhtDataSet> selectHlhtDataSetPageList(HlhtDataSet hlhtDataSet) throws DataAccessException;
}