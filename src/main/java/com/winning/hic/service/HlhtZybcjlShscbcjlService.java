package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtZybcjlShscbcjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SHSCBCJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:11
*/
public interface HlhtZybcjlShscbcjlService {

    public int createHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    public int modifyHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    public int removeHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    public HlhtZybcjlShscbcjl getHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    public int getHlhtZybcjlShscbcjlCount(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlPageList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    /**
     * 病历数据抽取
     * @param entity
     * @return
     */
    public List<MbzDataCheck> interfaceHlhtZybcjlShscbcjl(MbzDataCheck entity) throws Exception;

}