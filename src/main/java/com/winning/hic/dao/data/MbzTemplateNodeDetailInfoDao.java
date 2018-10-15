package com.winning.hic.dao.data;



import java.util.List;

import com.winning.hic.model.NodeTree;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzTemplateNodeDetailInfo;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 【模板明细节点信息】DAO接口
* @email Winning Health
* @package com.winning.hic.dao.data
* @date 2018-19-08 15:19:18
*/
@Repository
public interface MbzTemplateNodeDetailInfoDao {

    public int insertMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public int updateMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public int deleteMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public MbzTemplateNodeDetailInfo selectMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public Object selectMbzTemplateNodeDetailInfoCount(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public List<MbzTemplateNodeDetailInfo> selectMbzTemplateNodeDetailInfoList(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public List<MbzTemplateNodeDetailInfo> selectMbzTemplateNodeDetailInfoPageList(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    public int deleteMbzTemplateNodeDetailInfoByMbdm(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo) throws DataAccessException;

    List<NodeTree> selectNodeTreeFromMbzTemplateNodeDetailInfo(MbzTemplateNodeDetailInfo mbzTemplateNodeDetailInfo);
}