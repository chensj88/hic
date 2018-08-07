package com.winning.hic.dao.data;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzDictInfo;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title 【字典表】DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:07
*/
@Repository
public interface MbzDictInfoDao {

    public int insertMbzDictInfo(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public int updateMbzDictInfo(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public int deleteMbzDictInfo(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public MbzDictInfo selectMbzDictInfo(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public Object selectMbzDictInfoCount(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public List<MbzDictInfo> selectMbzDictInfoList(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public List<MbzDictInfo> selectMbzDictInfoPageList(MbzDictInfo mbzDictInfo) throws DataAccessException;

    public List<String> selectMbzDictInfoListForMB();
}