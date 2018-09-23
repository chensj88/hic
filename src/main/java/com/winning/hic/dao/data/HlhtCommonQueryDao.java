package com.winning.hic.dao.data;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZybcjlSjyscfjl;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface HlhtCommonQueryDao {

    /**
     * 住院根据关键字和病人首页序号来查询病例
     * @param obj
     * @return
     */
    List<EmrQtbljlk> selectEmrQtbljlkListByProc(Map<String,Object> obj);

    /**
     * 门诊根据关键字和病人首页序号来查询病例
     * @param obj
     * @return
     */
    List<EmrQtbljlk> selectEmrQtbljlkListByProcForMZ(Map<String,Object> obj);
}
