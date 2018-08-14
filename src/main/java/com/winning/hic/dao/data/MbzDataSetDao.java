package com.winning.hic.dao.data;



import java.util.List;

import com.winning.hic.model.NodeTree;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzDataSet;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title 基础数据配置表DAO接口
* @email Winning Health
* @package com.winning.hic.dao.data
* @date 2018-24-26 09:24:07
*/
@Repository
public interface MbzDataSetDao {

    public int insertMbzDataSet(MbzDataSet mbzDataSet) throws DataAccessException;

    public int updateMbzDataSet(MbzDataSet mbzDataSet) throws DataAccessException;

    public int deleteMbzDataSet(MbzDataSet mbzDataSet) throws DataAccessException;

    public MbzDataSet selectMbzDataSet(MbzDataSet mbzDataSet) throws DataAccessException;

    public Object selectMbzDataSetCount(MbzDataSet mbzDataSet) throws DataAccessException;

    public List<MbzDataSet> selectMbzDataSetList(MbzDataSet mbzDataSet) throws DataAccessException;

    public List<MbzDataSet> selectMbzDataSetPageList(MbzDataSet mbzDataSet) throws DataAccessException;

    public List<NodeTree> selectNodeTreeFromMbzDataSet(MbzDataSet mbzDataSet) throws DataAccessException;
}