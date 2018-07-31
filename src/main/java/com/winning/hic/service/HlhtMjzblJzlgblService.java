package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtMjzblJzlgbl;  


/**
* @author HLHT
* @title HLHT_MJZBL_JZLGBL
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
}