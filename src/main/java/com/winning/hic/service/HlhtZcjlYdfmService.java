package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZcjlYdfm;
import com.winning.hic.model.HlhtZybcjlCyjl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
 * @author HLHT
 * @title HLHT_ZCJL_YDFM
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-31-31 16:31:19
 */
public interface HlhtZcjlYdfmService {

    public int createHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm);

    public int modifyHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm);

    public int removeHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm);

    public HlhtZcjlYdfm getHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm);

    public int getHlhtZcjlYdfmCount(HlhtZcjlYdfm hlhtZcjlYdfm);

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmList(HlhtZcjlYdfm hlhtZcjlYdfm);

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmPageList(HlhtZcjlYdfm hlhtZcjlYdfm);

    public List<HlhtZcjlYdfm> getHlhtZcjlYdfmListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZcjlYdfmByYjlxh(HlhtZcjlYdfm hlhtZcjlYdfm);

    List<MbzDataCheck> interfaceHlhtZcjlYdfm(MbzDataCheck entity);

    public List<HlhtZcjlYdfm> selectHlhtZybcjlCyjlPageListByProc(HlhtZcjlYdfm hlhtZcjlYdfm);


}