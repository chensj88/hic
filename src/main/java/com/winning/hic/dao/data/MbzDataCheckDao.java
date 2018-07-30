package com.winning.hic.dao.data;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzDataCheck;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:05
*/
@Repository
public interface MbzDataCheckDao {

    public int insertMbzDataCheck(MbzDataCheck mbzDataCheck) throws DataAccessException;

    public int updateMbzDataCheck(MbzDataCheck mbzDataCheck) throws DataAccessException;

    public int deleteMbzDataCheck(MbzDataCheck mbzDataCheck) throws DataAccessException;

    public MbzDataCheck selectMbzDataCheck(MbzDataCheck mbzDataCheck) throws DataAccessException;

    public Object selectMbzDataCheckCount(MbzDataCheck mbzDataCheck) throws DataAccessException;

    public List<MbzDataCheck> selectMbzDataCheckList(MbzDataCheck mbzDataCheck) throws DataAccessException;

    public List<MbzDataCheck> selectMbzDataCheckPageList(MbzDataCheck mbzDataCheck) throws DataAccessException;
}