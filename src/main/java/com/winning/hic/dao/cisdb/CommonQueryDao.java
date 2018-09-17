package com.winning.hic.dao.cisdb;

import com.winning.hic.model.*;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-08-13
 * Time: 9:00
 */
@Repository
public interface CommonQueryDao {


    /**
     * 获取入院记录/24H出入院记录病人公共数据
     * @param rcyjl
     * @return
     */
    public HlhtRyjlRcyjl selectInitHlhtRyjlRcyjlData(HlhtRyjlRcyjl rcyjl);

    /**
     * 生成入院记录/24小时死亡记录病人基础公共信息
     * @param hlhtRyjlRyswjl
     * @return
     */
    public HlhtRyjlRyswjl selectInitHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl);

    /**
     * 获取住院病程/手术术后首次病程初始化数据
     * @param hlhtZybcjlShscbcjl
     * @return
     */
    HlhtZybcjlShscbcjl selectInitHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl);

    /**
     * 获取住院病程/术前小结公共病人数据
     * @param hlhtZybcjlSqxj
     * @return
     */
    HlhtZybcjlSqxj selectInitHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj);
    /**
     * 住院病程记录/术前讨论
     * @param sqtl
     * @return
     */
    HlhtZybcjlSqtl selectInitHlhtZybcjlSqtl(HlhtZybcjlSqtl sqtl);

    /**
     * 住院病程记录/死亡病历讨论记录
     * @param swbltljl
     * @return
     */
    HlhtZybcjlSwbltljl selectInitHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl swbltljl);

    /**
     * 住院病程记录/上级医生查房记录
     * @param hlhtZybcjlSjyscfjl
     * @return
     */
    HlhtZybcjlSjyscfjl selectInitHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    /**
     * 知情告知信息/手术同意书
     * @param hlhtZqgzxxSstys
     * @return
     */
    HlhtZqgzxxSstys selectInitHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys);
    /**
     * 知情告知信息/特殊检查及特殊治疗同意书
     * @param hlhtZqgzxxTsjczltys
     * @return
     */
    HlhtZqgzxxTsjczltys selectInitHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    /**
     * 门(急)诊病历/急诊留观病历
     * @param obj
     * @return
     */
    HlhtMjzblJzlgbl selectInitHlhtMjzblJzlgbl(HlhtMjzblJzlgbl obj);

    /**
     *病历概要/基本健康信息
     * @param obj
     * @return
     */
    List<HlhtBlgyJbjkxx> selectInitHlhtBlgyJbjkxx(HlhtBlgyJbjkxx obj);

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
     * 首次病程记录表
     * @param obj
     * @return
     */
    HlhtZybcjlScbcjl selectInitialHlhtZybcjlScbcjl(HlhtZybcjlScbcjl entity);

    /**
     * 阶段小结数据集表
     * @param obj
     * @return
     */
    HlhtZybcjlJdxj selectInitialHlhtZybcjlJdxj(HlhtZybcjlJdxj entity);

    /**
     * 抢救记录数据集表
     * @param obj
     * @return
     */
    HlhtZybcjlQjjl selectInitialHlhtZybcjlQjjl(HlhtZybcjlQjjl entity);

    /**
     * 其他知情告知同意书
     * @param obj
     * @return
     */
    HlhtZqgzxxQtzqtys selectInitialHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys entity);

    /**
     * 一般手术记录表(待定）
     * @param obj
     * @return
     */
    HlhtZlczjlYbssjl selectInitialHlhtZlczjlYbssjl(HlhtZlczjlYbssjl entity);
    /**
     * 会诊记录数据集表
     * @param obj
     * @return
     */
    HlhtZybcjlHzjl selectInitialHlhtZybcjlHzjl(HlhtZybcjlHzjl entity);
    /**
     * 出院小结数据集表
     * @param obj
     * @return
     */
    HlhtCyxjCyxj selectInitialHlhtCyxjCyxj(HlhtCyxjCyxj entity);
    /**
     * 转科记录数据集表
     * @param obj
     * @return
     */
    HlhtZybcjlZkjl selectInitialHlhtZybcjlZkjl(HlhtZybcjlZkjl entity);

    /**
     * 转诊(院)记录数据集表
     * @param obj
     * @return
     */
    HlhtZzyjlZzyjl selectInitialHlhtZzyjlZzyjl(HlhtZzyjlZzyjl entity);
    /**
     * 门急诊病历记录表
     * @param obj
     * @return
     */
    HlhtMjzblMjzbl selectInitialHlhtMjzblMjzbl(HlhtMjzblMjzbl entity);

    /**
     * 剖宫产记录表
     * @param obj
     * @return
     */
    HlhtZcjlPgc selectInitialHlhtZcjlPgc(HlhtZcjlPgc entity);

    void insertHlhtBlgyWssjzyAll(HlhtBlgyWssjzy wssjzy);
}
