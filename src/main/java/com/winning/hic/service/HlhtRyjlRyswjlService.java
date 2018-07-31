package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtRyjlRyswjl;  


/**
* @author HLHT
* @title HLHT_RYJL_RYSWJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-30-31 16:30:41
*/
public interface HlhtRyjlRyswjlService {

    public int createHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    public int modifyHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    public int removeHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    public HlhtRyjlRyswjl getHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    public int getHlhtRyjlRyswjlCount(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlList(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlPageList(HlhtRyjlRyswjl hlhtRyjlRyswjl);
}