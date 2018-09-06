package com.winning.hic.dao.cisdb;


import com.winning.hic.model.EmrMbmxk;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-11-06 13:11:33
*/
@Repository
public interface EmrMbmxkDao {

    public int insertEmrMbmxk(EmrMbmxk emrMbmxk) throws DataAccessException;

    public int updateEmrMbmxk(EmrMbmxk emrMbmxk) throws DataAccessException;

    public int deleteEmrMbmxk(EmrMbmxk emrMbmxk) throws DataAccessException;

    public EmrMbmxk selectEmrMbmxk(EmrMbmxk emrMbmxk) throws DataAccessException;

    public Object selectEmrMbmxkCount(EmrMbmxk emrMbmxk) throws DataAccessException;

    public List<EmrMbmxk> selectEmrMbmxkList(EmrMbmxk emrMbmxk) throws DataAccessException;

    public List<EmrMbmxk> selectEmrMbmxkPageList(EmrMbmxk emrMbmxk) throws DataAccessException;
}