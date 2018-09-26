package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtMjzblJzlgbl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_MJZBL_JZLGBL 急诊留观病历
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-29-31 16:29:33
*/
public interface HlhtMjzblJzlgblService {

    public int createHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    public int modifyHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    public int removeHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    public HlhtMjzblJzlgbl getHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    public int getHlhtMjzblJzlgblCount(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    public List<HlhtMjzblJzlgbl> getHlhtMjzblJzlgblList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    public List<HlhtMjzblJzlgbl> getHlhtMjzblJzlgblPageList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl);

    List<MbzDataCheck> interfaceHlhtMjzblJzlgbl(MbzDataCheck entity) throws Exception;
}