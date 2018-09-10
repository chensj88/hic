package com.winning.hic.dao.cisdb;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.EmrHzsqdjlk;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-03-10 10:03:19
*/
@Repository
public interface EmrHzsqdjlkDao {

    public int insertEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public int updateEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public int deleteEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public EmrHzsqdjlk selectEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public Object selectEmrHzsqdjlkCount(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public List<EmrHzsqdjlk> selectEmrHzsqdjlkList(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public List<EmrHzsqdjlk> selectEmrHzsqdjlkPageList(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public List<EmrHzsqdjlk> selectEmrHzsqdjlkList2(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

}