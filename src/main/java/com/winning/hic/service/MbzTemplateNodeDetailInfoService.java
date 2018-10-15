package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzTemplateNodeDetailInfo;
import com.winning.hic.model.NodeTree;


/**
* @author HLHT
* @title 【模板明细节点信息】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-19-08 15:19:18
*/
public interface MbzTemplateNodeDetailInfoService {

    public int createMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    public int modifyMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    public int removeMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    public MbzTemplateNodeDetailInfo getMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    public int getMbzTemplateNodeDetailInfoCount(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    public List<MbzTemplateNodeDetailInfo> getMbzTemplateNodeDetailInfoList(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    public List<MbzTemplateNodeDetailInfo> getMbzTemplateNodeDetailInfoPageList(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);

    Object createMbzTemplateNodeDetailInfoList(List<MbzTemplateNodeDetailInfo> templateNodeDetailInfos);

    List<NodeTree> getNodeTreeFromMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);
}