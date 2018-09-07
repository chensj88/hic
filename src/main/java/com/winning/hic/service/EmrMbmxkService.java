package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.EmrMbmxk;  


/**
* @author HLHT
* @title EMR_MBMXK
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-11-06 13:11:33
*/
public interface EmrMbmxkService {

    public int createEmrMbmxk(EmrMbmxk emrMbmxk);

    public int modifyEmrMbmxk(EmrMbmxk emrMbmxk);

    public int removeEmrMbmxk(EmrMbmxk emrMbmxk);

    public EmrMbmxk getEmrMbmxk(EmrMbmxk emrMbmxk);

    public int getEmrMbmxkCount(EmrMbmxk emrMbmxk);

    public List<EmrMbmxk> getEmrMbmxkList(EmrMbmxk emrMbmxk);

    public List<EmrMbmxk> getEmrMbmxkPageList(EmrMbmxk emrMbmxk);
}