package com.winning.hic.service.impl;

import com.winning.hic.model.MBNoteTree;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import com.winning.hic.model.EmrMxmcmlk;  

import com.winning.hic.dao.EmrMxmcmlkDao;  

import com.winning.hic.service.EmrMxmcmlkService;  


/**
* @author chensj
* @title EMR_MXMCMLK
* @email chensj@163.com
* @package com.winning.hic.service.impl
* @date 2018-05-23 09:05:13
*/
@Service
public class EmrMxmcmlkServiceImpl implements  EmrMxmcmlkService {

    @Autowired
    private EmrMxmcmlkDao emrMxmcmlkDao;

    public int createEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk){
        return this.emrMxmcmlkDao.insertEmrMxmcmlk(emrMxmcmlk);
    }

    public int modifyEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk){
        return this.emrMxmcmlkDao.updateEmrMxmcmlk(emrMxmcmlk);
    }

    public int removeEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk){
        return this.emrMxmcmlkDao.deleteEmrMxmcmlk(emrMxmcmlk);
    }

    public EmrMxmcmlk getEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk){
        return this.emrMxmcmlkDao.selectEmrMxmcmlk(emrMxmcmlk);
    }

    public int getEmrMxmcmlkCount(EmrMxmcmlk emrMxmcmlk){
        return (Integer)this.emrMxmcmlkDao.selectEmrMxmcmlkCount(emrMxmcmlk);
    }

    public List<EmrMxmcmlk> getEmrMxmcmlkList(EmrMxmcmlk emrMxmcmlk){
        return this.emrMxmcmlkDao.selectEmrMxmcmlkList(emrMxmcmlk);
    }

    public List<EmrMxmcmlk> getEmrMxmcmlkPageList(EmrMxmcmlk emrMxmcmlk){
        return this.emrMxmcmlkDao.selectEmrMxmcmlkPageList(emrMxmcmlk);
    }

    @Override
    public List<MBNoteTree> createEmrMxmcmlkTree() {
        List<EmrMxmcmlk> parentList = emrMxmcmlkDao.selectEmrMxmcmlkParentList();
        List<MBNoteTree> mbNoteTrees = new ArrayList<>();
        for (EmrMxmcmlk mxmcmlk1 : parentList) {
            mbNoteTrees.add(mxmcmlk1.getMBNoteTree());
        }
        return mbNoteTrees;
    }

    @Override
    public List<MBNoteTree> getEmrMxmcmlkListTree(EmrMxmcmlk mxmcmlk) {
        List<MBNoteTree> mbNoteTrees = new ArrayList<>();
        List<EmrMxmcmlk> mxmcmlkList = emrMxmcmlkDao.selectEmrMxmcmlkFirstChildList(mxmcmlk);
        for (EmrMxmcmlk emrMxmcmlk : mxmcmlkList) {
            mbNoteTrees.add(emrMxmcmlk.getMBNoteTree());
        }
        return mbNoteTrees;
    }

}