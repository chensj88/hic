package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.EmrMbk;
import com.winning.hic.model.MBNoteTree;


/**
* @author chensj
* @title EMR_MBK
* @email chensj@163.com
* @package com.winning.hic.service
* @date 2018-05-23 09:05:16
*/
public interface EmrMbkService {

    public int createEmrMbk(EmrMbk emrMbk);

    public int modifyEmrMbk(EmrMbk emrMbk);

    public int removeEmrMbk(EmrMbk emrMbk);

    public EmrMbk getEmrMbk(EmrMbk emrMbk);

    public int getEmrMbkCount(EmrMbk emrMbk);

    public List<EmrMbk> getEmrMbkList(EmrMbk emrMbk);

    public List<EmrMbk> getEmrMbkPageList(EmrMbk emrMbk);

}