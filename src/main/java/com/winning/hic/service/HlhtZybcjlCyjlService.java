package com.winning.hic.service;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZybcjlCyjl;
import com.winning.hic.model.MbzDataCheck;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_CYJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-33-31 16:33:08
*/
public interface HlhtZybcjlCyjlService {

    public int createHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public int modifyHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public int removeHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public HlhtZybcjlCyjl getHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public int getHlhtZybcjlCyjlCount(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlList(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlPageList(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    List<MbzDataCheck> interfaceHlhtZybcjlCyjl(MbzDataCheck entity);

    public void deleteHlhtZybcjlCyjlByYjlxh(HlhtZybcjlCyjl hlhtZybcjlCyjl);

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlListFromBaseData(EmrQtbljlk emrQtbljlk);

    public List<HlhtZybcjlCyjl> selectHlhtZybcjlCyjlListByProc(HlhtZybcjlCyjl hlhtZybcjlCyjl);
}