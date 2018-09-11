package com.winning.hic.dao.mz;


import com.winning.hic.model.EmrHzsqdjlk;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-03-10 10:03:19
*/
@Repository
public interface MZEmrHzsqdjlkDao {

    public int insertEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public int updateEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public int deleteEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public EmrHzsqdjlk selectEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public Object selectEmrHzsqdjlkCount(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public List<EmrHzsqdjlk> selectEmrHzsqdjlkList(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public List<EmrHzsqdjlk> selectEmrHzsqdjlkPageList(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

    public List<EmrHzsqdjlk> selectEmrHzsqdjlkList2(EmrHzsqdjlk emrHzsqdjlk) throws DataAccessException;

}