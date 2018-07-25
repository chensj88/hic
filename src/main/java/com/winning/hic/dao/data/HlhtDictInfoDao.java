package com.winning.hic.dao.data;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtDictInfo;



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 【字典表】DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:07
*/
@Repository
public interface HlhtDictInfoDao {

    public int insertHlhtDictInfo(HlhtDictInfo hlhtDictInfo) throws DataAccessException;

    public int updateHlhtDictInfo(HlhtDictInfo hlhtDictInfo) throws DataAccessException;

    public int deleteHlhtDictInfo(HlhtDictInfo hlhtDictInfo) throws DataAccessException;

    public HlhtDictInfo selectHlhtDictInfo(HlhtDictInfo hlhtDictInfo) throws DataAccessException;

    public Object selectHlhtDictInfoCount(HlhtDictInfo hlhtDictInfo) throws DataAccessException;

    public List<HlhtDictInfo> selectHlhtDictInfoList(HlhtDictInfo hlhtDictInfo) throws DataAccessException;

    public List<HlhtDictInfo> selectHlhtDictInfoPageList(HlhtDictInfo hlhtDictInfo) throws DataAccessException;
}