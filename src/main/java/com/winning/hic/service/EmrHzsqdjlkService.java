package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.EmrHzsqdjlk;  


/**
* @author HLHT
* @title EMR_HZSQDJLK
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-03-10 10:03:19
*/
public interface EmrHzsqdjlkService {

    public int createEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk);

    public int modifyEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk);

    public int removeEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk);

    public EmrHzsqdjlk getEmrHzsqdjlk(EmrHzsqdjlk emrHzsqdjlk);

    public int getEmrHzsqdjlkCount(EmrHzsqdjlk emrHzsqdjlk);

    public List<EmrHzsqdjlk> getEmrHzsqdjlkList(EmrHzsqdjlk emrHzsqdjlk);

    public List<EmrHzsqdjlk> getEmrHzsqdjlkPageList(EmrHzsqdjlk emrHzsqdjlk);
}