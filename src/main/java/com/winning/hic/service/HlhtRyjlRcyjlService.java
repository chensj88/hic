package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtRyjlRcyjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_RYJL_RCYJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-30-31 16:30:31
*/
public interface HlhtRyjlRcyjlService {

    public int createHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    public int modifyHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    public int removeHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    public HlhtRyjlRcyjl getHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    public int getHlhtRyjlRcyjlCount(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    public List<HlhtRyjlRcyjl> getHlhtRyjlRcyjlList(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    public List<HlhtRyjlRcyjl> getHlhtRyjlRcyjlPageList(HlhtRyjlRcyjl hlhtRyjlRcyjl);

    /**
     * 生成24小时入出院记录
     * @param rcyjl
     */
    public HlhtRyjlRcyjl getInitHlhtRyjlRcyjlData(HlhtRyjlRcyjl rcyjl);

    public List<MbzDataCheck> interfaceHlhtRyjlRcyjl( MbzDataCheck entity) throws Exception;
}