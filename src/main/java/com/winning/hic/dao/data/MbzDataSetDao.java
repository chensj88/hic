package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.MbzDataSet;



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 基础数据配置表DAO接口
* @email Winning Health
* @package com.winning.hic.dao.data
* @date 2018-24-26 09:24:07
*/
@Repository
public interface MbzDataSetDao {

    public int insertMbzDataSet(MbzDataSet hlhtDataSet) throws DataAccessException;

    public int updateMbzDataSet(MbzDataSet hlhtDataSet) throws DataAccessException;

    public int deleteMbzDataSet(MbzDataSet hlhtDataSet) throws DataAccessException;

    public MbzDataSet selectMbzDataSet(MbzDataSet hlhtDataSet) throws DataAccessException;

    public Object selectMbzDataSetCount(MbzDataSet hlhtDataSet) throws DataAccessException;

    public List<MbzDataSet> selectMbzDataSetList(MbzDataSet hlhtDataSet) throws DataAccessException;

    public List<MbzDataSet> selectMbzDataSetPageList(MbzDataSet hlhtDataSet) throws DataAccessException;
}