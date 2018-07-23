package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.EmrMxmcmlk;
import com.winning.hic.model.MBNoteTree;


/**
* @author chensj
* @title EMR_MXMCMLK
* @email chensj@163.com
* @package com.winning.hic.service
* @date 2018-05-23 09:05:13
*/
public interface EmrMxmcmlkService {

    public int createEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk);

    public int modifyEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk);

    public int removeEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk);

    public EmrMxmcmlk getEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk);

    public int getEmrMxmcmlkCount(EmrMxmcmlk emrMxmcmlk);

    public List<EmrMxmcmlk> getEmrMxmcmlkList(EmrMxmcmlk emrMxmcmlk);

    public List<EmrMxmcmlk> getEmrMxmcmlkPageList(EmrMxmcmlk emrMxmcmlk);

    List<MBNoteTree> createEmrMxmcmlkTree();

    List<MBNoteTree> getEmrMxmcmlkListTree(EmrMxmcmlk mxmcmlk);
}