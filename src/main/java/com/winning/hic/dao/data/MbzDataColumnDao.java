package com.winning.hic.dao.data;



import java.util.List;
import com.winning.hic.model.support.ColumnInfo;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzDataColumn;  

import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 【基础字段信息】DAO接口
* @email Winning Health
* @package com.winning.hic.dao.cisdb
* @date 2018-14-08 16:14:22
*/
@Repository
public interface MbzDataColumnDao {

    public int insertMbzDataColumn(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public int updateMbzDataColumn(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public int deleteMbzDataColumn(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public MbzDataColumn selectMbzDataColumn(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public Object selectMbzDataColumnCount(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public List<MbzDataColumn> selectMbzDataColumnList(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public List<MbzDataColumn> selectMbzDataColumnPageList(MbzDataColumn mbzDataColumn) throws DataAccessException;

    public List<ColumnInfo> selectAllColumnsBySourceType(MbzDataColumn mbzDataColumn);
}