package com.winning.hic.dao.data;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.MbzLoadDataInfo;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 【抽取数据明细数据】DAO接口
* @email Winning Health
* @package com.winning.hic.dao.data
* @date 2018-24-10 15:24:35
*/
@Repository
public interface MbzLoadDataInfoDao {

    public int insertMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    public int updateMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    public int deleteMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    public MbzLoadDataInfo selectMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    public Object selectMbzLoadDataInfoCount(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    public List<MbzLoadDataInfo> selectMbzLoadDataInfoList(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    public List<MbzLoadDataInfo> selectMbzLoadDataInfoPageList(MbzLoadDataInfo mbzLoadDataInfo) throws DataAccessException;

    void deleteMbzLoadDataInfoBySourceIdAndSourceType(Map<String,Object> param);
}