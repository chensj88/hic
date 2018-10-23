package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.MbzDataCheck;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-17 13:34:32
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

    public void deleteMbzDataCheckList(MbzDataCheck mbzDataCheck)throws DataAccessException;

    List<MbzDataCheck> selectMbzDataCheckHandList(MbzDataCheck mbzDataCheck)throws DataAccessException;
}