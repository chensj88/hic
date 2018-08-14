package com.winning.hic.dao.cisdb;

import com.winning.hic.model.*;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

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
}
