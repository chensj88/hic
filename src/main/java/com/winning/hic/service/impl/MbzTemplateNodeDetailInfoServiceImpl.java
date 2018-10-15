package com.winning.hic.service.impl;

import com.winning.hic.model.NodeTree;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzTemplateNodeDetailInfo;  

import com.winning.hic.dao.data.MbzTemplateNodeDetailInfoDao;  

import com.winning.hic.service.MbzTemplateNodeDetailInfoService;  


/**
* @author HLHT
* @title 【模板明细节点信息】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-19-08 15:19:18
*/
@Service
public class MbzTemplateNodeDetailInfoServiceImpl implements  MbzTemplateNodeDetailInfoService {

    @Autowired
    private MbzTemplateNodeDetailInfoDao mbzTemplateNodeDetailInfoDao;

    public int createMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.insertMbzTemplateNodeDetailInfo(mbzTemplateNodeDetailInfo);
    }

    public int modifyMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.updateMbzTemplateNodeDetailInfo(mbzTemplateNodeDetailInfo);
    }

    public int removeMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.deleteMbzTemplateNodeDetailInfo(mbzTemplateNodeDetailInfo);
    }

    public int removeMbzTemplateNodeDetailInfoByMbdm(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.deleteMbzTemplateNodeDetailInfoByMbdm(mbzTemplateNodeDetailInfo);
    }

    public MbzTemplateNodeDetailInfo getMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.selectMbzTemplateNodeDetailInfo(mbzTemplateNodeDetailInfo);
    }

    public int getMbzTemplateNodeDetailInfoCount(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return (Integer)this.mbzTemplateNodeDetailInfoDao.selectMbzTemplateNodeDetailInfoCount(mbzTemplateNodeDetailInfo);
    }

    public List<MbzTemplateNodeDetailInfo> getMbzTemplateNodeDetailInfoList(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.selectMbzTemplateNodeDetailInfoList(mbzTemplateNodeDetailInfo);
    }

    public List<MbzTemplateNodeDetailInfo> getMbzTemplateNodeDetailInfoPageList(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo){
        return this.mbzTemplateNodeDetailInfoDao.selectMbzTemplateNodeDetailInfoPageList(mbzTemplateNodeDetailInfo);
    }

    @Override
    public Object createMbzTemplateNodeDetailInfoList(List<MbzTemplateNodeDetailInfo> templateNodeDetailInfos) {
        if(templateNodeDetailInfos != null && templateNodeDetailInfos.size() > 0){
            MbzTemplateNodeDetailInfo tempInfo = new MbzTemplateNodeDetailInfo();
            tempInfo.setMbdm(templateNodeDetailInfos.get(0).getMbdm());
            this.removeMbzTemplateNodeDetailInfoByMbdm(tempInfo);
        }
        for (MbzTemplateNodeDetailInfo detailInfo : templateNodeDetailInfos) {
            createMbzTemplateNodeDetailInfo(detailInfo);
        }
        return templateNodeDetailInfos.size();
    }

    @Override
    public List<NodeTree> getNodeTreeFromMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) {
        return this.mbzTemplateNodeDetailInfoDao.selectNodeTreeFromMbzTemplateNodeDetailInfo(mbzTemplateNodeDetailInfo);
    }
}