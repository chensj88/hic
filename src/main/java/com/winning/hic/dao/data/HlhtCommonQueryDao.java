package com.winning.hic.dao.data;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZybcjlSjyscfjl;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface HlhtCommonQueryDao {


    List<EmrQtbljlk> selectEmrQtbljlkListByProc(Map<String,Object> obj);

}
