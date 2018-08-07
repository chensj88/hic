package com.winning.hic.service;

import com.winning.hic.model.HlhtRyjlJbxx;

import java.util.List;


/**
 * @author HLHT
 * @title HLHT_RYJL_JBXX
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-30-31 16:30:20
 */
public interface HlhtRyjlJbxxService {

    public int createHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx);

    public int modifyHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx);

    public int removeHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx);

    public HlhtRyjlJbxx getHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx);

    public int getHlhtRyjlJbxxCount(HlhtRyjlJbxx hlhtRyjlJbxx);

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxList(HlhtRyjlJbxx hlhtRyjlJbxx);

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxPageList(HlhtRyjlJbxx hlhtRyjlJbxx);

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxListFromBaseData();

}