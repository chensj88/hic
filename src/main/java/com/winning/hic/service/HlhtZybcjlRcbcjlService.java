package com.winning.hic.service;

import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtRyjlJbxx;
import com.winning.hic.model.HlhtZybcjlRcbcjl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
* @author HLHT
* @title HLHT_ZYBCJL_RCBCJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-33-31 16:33:54
*/
public interface HlhtZybcjlRcbcjlService {

    public int createHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public int modifyHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public int removeHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public HlhtZybcjlRcbcjl getHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public int getHlhtZybcjlRcbcjlCount(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlPageList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public List<HlhtZybcjlRcbcjl> getHlhtRyjlJbxxListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtRyjlJbxxByYjlxh(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    List<MbzDataCheck> interfaceHlhtZybcjlRcbcjl(MbzDataCheck entity) throws Exception;
}