package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtCyxjCyxj;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_CYXJ_CYXJ
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-29-31 16:29:18
*/
public interface HlhtCyxjCyxjService {

    public int createHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj);

    public int modifyHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj);

    public int removeHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj);

    public HlhtCyxjCyxj getHlhtCyxjCyxj(HlhtCyxjCyxj hlhtCyxjCyxj);

    public int getHlhtCyxjCyxjCount(HlhtCyxjCyxj hlhtCyxjCyxj);

    public List<HlhtCyxjCyxj> getHlhtCyxjCyxjList(HlhtCyxjCyxj hlhtCyxjCyxj);

    public List<HlhtCyxjCyxj> getHlhtCyxjCyxjPageList(HlhtCyxjCyxj hlhtCyxjCyxj);

    public List<MbzDataCheck> interfaceHlhtCyxjCyxj(MbzDataCheck t);
}