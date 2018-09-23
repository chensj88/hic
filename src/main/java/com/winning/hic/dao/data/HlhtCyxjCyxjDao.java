package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtCyxjCyxj;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-29-31 16:29:18
*/
@Repository
public interface HlhtCyxjCyxjDao {

    public int insertHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public int updateHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public int deleteHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public HlhtCyxjCyxj selectHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public Object selectHlhtCyxjCyxjCount(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public List<HlhtCyxjCyxj> selectHlhtCyxjCyxjList(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public List<HlhtCyxjCyxj> selectHlhtCyxjCyxjPageList(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    public HlhtCyxjCyxj selectInitialHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj) throws DataAccessException;

    List<HlhtCyxjCyxj> selectHlhtCyxjCyxjListByProc(HlhtCyxjCyxj oneCyxj)throws DataAccessException;
}