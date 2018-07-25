package com.winning.hic.dao.cisdb;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.EmrMbk;  



import org.springframework.stereotype.Repository;
/**
* @author chensj
* @title DAO接口
* @email chensj@163.com
* @package com.winning.hic.dao
* @date 2018-05-23 09:05:16
*/
@Repository
public interface EmrMbkDao {

    public int insertEmrMbk(EmrMbk emrMbk) throws DataAccessException;

    public int updateEmrMbk(EmrMbk emrMbk) throws DataAccessException;

    public int deleteEmrMbk(EmrMbk emrMbk) throws DataAccessException;

    public EmrMbk selectEmrMbk(EmrMbk emrMbk) throws DataAccessException;

    public Object selectEmrMbkCount(EmrMbk emrMbk) throws DataAccessException;

    public List<EmrMbk> selectEmrMbkList(EmrMbk emrMbk) throws DataAccessException;

    public List<EmrMbk> selectEmrMbkPageList(EmrMbk emrMbk) throws DataAccessException;
}