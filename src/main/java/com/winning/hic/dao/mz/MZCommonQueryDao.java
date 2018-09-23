package com.winning.hic.dao.mz;

import com.winning.hic.model.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-08-13
 * Time: 9:00
 */
@Repository
public interface MZCommonQueryDao {

    /**
     * 门(急)诊病历/急诊留观病历
     * @param obj
     * @return
     */
    HlhtMjzblJzlgbl selectInitHlhtMjzblJzlgbl(HlhtMjzblJzlgbl obj);

    /**
     *病历概要/基本健康信息 门诊
     * @param obj
     * @return
     */
    List<HlhtBlgyJbjkxx> selectInitHlhtBlgyJbjkxxForMz(HlhtBlgyJbjkxx obj);

    /**
     * 门(急)诊处方/西药处方
     * @param obj
     * @return
     */
    List<HlhtMjzcfXycf> selectInitHlhtMjzcfXycf(HlhtMjzcfXycf obj);
    /**
     * 门(急)诊处方/西药处方 历史
     * @param obj
     * @return
     */
    List<HlhtMjzcfXycf> selectInitHlhtMjzcfXycfForLS(HlhtMjzcfXycf obj);

    /**
     * 卫生事件
     * @param obj
     * @return
     */
    void insertHlhtBlgyWssjzyAll(HlhtBlgyWssjzy wssjzy);

    /**
     * 门急诊病历记录表
     * @param obj
     * @return
     */
    HlhtMjzblMjzbl selectInitialHlhtMjzblMjzbl(HlhtMjzblMjzbl entity);

    /**
     * 卫生事件摘要表
     * @param obj
     * @return
     */
    List<HlhtBlgyWssjzy> selectBlgyWssjzyMzList(HlhtBlgyWssjzy wssjzy);
}
