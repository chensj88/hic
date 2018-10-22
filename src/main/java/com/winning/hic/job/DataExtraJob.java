package com.winning.hic.job;

import com.winning.hic.base.utils.DateUtil;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.Facade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author chensj
 * @title 数据抽取任务
 * @email chensj@winning.com.cn
 * @package com.winning.hic.job
 * @date: 2018-09-13 11:08
 */
@Configuration
@Component
@EnableScheduling
public class DataExtraJob {


    @Autowired
    private Facade facade;

    private static final Logger logger = LoggerFactory.getLogger(DataExtraJob.class);

    public void extraData() {
        logger.info("数据抽取开始时间为：[{}]", DateUtil.format(new Date(),DateUtil.PATTERN_19));
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DATE, c.get(Calendar.DATE) - 1); //抽取前一天数据 注释则抽取当前数据
        String beforeToday = DateUtil.format(c.getTime());
        //System.out.println(beforeToday);
        String startDate = beforeToday + " 00:00:00";
        String endDate = beforeToday + " 23:59:59";
        dataLoad(startDate,endDate);
        logger.info("数据抽取结束时间为：[{}]", DateUtil.format(new Date(),DateUtil.PATTERN_19));
    }


    private void dataLoad(String startDate, String endDate) {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate", startDate);
        entity.getMap().put("endDate", endDate);
        entity.setIsAutomate(1);
        try {
            //删除原来的检验结果
            facade.getMbzDataCheckService().removeMbzDataCheckList(entity);
            //1. 24h内入出院记录  --陈世杰
            List<MbzDataCheck> mbzDataCheck1 = facade.getHlhtRyjlRcyjlService().interfaceHlhtRyjlRcyjl(entity);
            //2. 24h内入院死亡记录*  -- 陈世杰
            List<MbzDataCheck> mbzDataCheck2 = facade.getHlhtRyjlRyswjlService().interfaceHlhtRyjlRyswjl(entity);
            //3. 病危（重）通知书*  --陈枫
            List<MbzDataCheck> mbzDataChecks3 = facade.getHlhtZqgzxxBwztzsService().interfaceHlhtZqgzxxBwztzs(entity);
            //4.出院记录数据集表* --陈枫
            List<MbzDataCheck> mbzDataChecks4 = facade.getHlhtZybcjlCyjlService().interfaceHlhtZybcjlCyjl(entity);
            //5.入院记录* --陈枫
            List<MbzDataCheck> mbzDataChecks5 = facade.getHlhtRyjlJbxxService().interfaceHlhtRyjlJbxx(entity);
            //6.首次病程记录表* --陈蒯
            MbzDataCheck mbzDataCheck6 = facade.getHlhtZybcjlScbcjlService().interfaceHlhtZybcjlScbcjl(entity);
            //7.日常病程记录数据集表*  --陈枫
            List<MbzDataCheck> mbzDataChecks7 = facade.getHlhtZybcjlRcbcjlService().interfaceHlhtZybcjlRcbcjl(entity);
            //8.交接班记录数据集表(医院一般不在病历里面写交接班记录，CIS有一个交接班的功能)*    --陈蒯（暂时不处理）
            List<MbzDataCheck> mbzDataChecks8 = facade.getHlhtZybcjlJjbjlService().interfaceHlhtZybcjlJjbjl(entity);
            //9.--阶段小结数据集表*   --陈蒯
            List<MbzDataCheck> mbzDataChecks9 = facade.getHlhtZybcjlJdxjService().interfaceHlhtZybcjlJdxj(entity);
            //10.抢救记录数据集表*  --陈蒯
            List<MbzDataCheck> mbzDataChecks10 = facade.getHlhtZybcjlQjjlService().interfaceHlhtZybcjlQjjl(entity);
            //11.术后首次病程记录数据集表* --- 陈世杰
            List<MbzDataCheck> mbzDataChecks11 = facade.getHlhtZybcjlShscbcjlService().interfaceHlhtZybcjlShscbcjl(entity);
            //12.术前小结数据集表* --- 陈世杰
            List<MbzDataCheck> mbzDataChecks12 = facade.getHlhtZybcjlSqxjService().interfaceHlhtZybcjlSqxj(entity);
            //13.术前讨论数据集表*   --陈世杰
            List<MbzDataCheck> mbzDataChecks13 = facade.getHlhtZybcjlSqtlService().interfaceHlhtZybcjlSqtl(entity);
            //14.死亡病历讨论记录数据集表* --陈世杰
            List<MbzDataCheck> mbzDataChecks14 = facade.getHlhtZybcjlSwbltljlService().interfaceHlhtZybcjlSwbltljl(entity);
            //15.死亡记录数据集表*  --陈枫
            List<MbzDataCheck> mbzDataChecks15 = facade.getHlhtZybcjlSwjlService().interfaceHlhtZybcjlSwjl(entity);
            //16.麻醉术前访视记录表(由手麻系统处理）* --陈枫（暂时不处理）
            List<MbzDataCheck> mbzDataChecks16 = facade.getHlhtZlczjlMzsqfsjlService().interfaceHlhtZlczjlMzsqfsjl(entity);
            //17.麻醉术后访视记录表(由手麻系统处理)*   --陈枫（暂时不处理）
            List<MbzDataCheck> mbzDataChecks17 = facade.getHlhtZlczjlMzshfsjlService().interfaceHlhtZlczjlMzshfsjl(entity);
            //18.麻醉知情同意书表* --陈枫
            List<MbzDataCheck> mbzDataChecks18 = facade.getHlhtZqgzxxMzzqtysService().interfaceHlhtZqgzxxMzzqtys(entity);
            //19.其他知情告知同意书*  --陈蒯
            List<MbzDataCheck> mbzDataChecks19 = facade.getHlhtZqgzxxQtzqtysService().interfaceHlhtZqgzxxQtzqtys(entity);
            //20.一般手术记录表(待定）*    --陈蒯
            List<MbzDataCheck> mbzDataChecks20 = facade.getHlhtZlczjlYbssjlService().interfaceHlhtZlczjlYbssjl(entity);
            //21.会诊记录数据集表* --陈蒯
            List<MbzDataCheck> mbzDataChecks21 = facade.getHlhtZybcjlHzjlService().interfaceHlhtZybcjlHzjl(entity);
            //22.出院小结数据集表*  --陈蒯
            List<MbzDataCheck> mbzDataChecks22 = facade.getHlhtCyxjCyxjService().interfaceHlhtCyxjCyxj(entity);
            //23.上级医师查房记录数据集表*  --陈世杰
            List<MbzDataCheck> mbzDataChecks23 = facade.getHlhtZybcjlSjyscfjlService().interfaceHlhtZybcjlSjyscfjl(entity);
            //24.手术知情同意书表*--陈世杰
            List<MbzDataCheck> mbzDataChecks24 = facade.getHlhtZqgzxxSstysService().interfaceHlhtZqgzxxSstys(entity);
            //25.输血治疗同意书表* -- 陈枫
            List<MbzDataCheck> mbzDataChecks25 = facade.getHlhtZqgzxxSxzltysService().interfaceHlhtZqgzxxSxzltys(entity);
            //26.疑难病例讨论数据集表* --陈枫
            List<MbzDataCheck> mbzDataChecks26 = facade.getHlhtZybcjlYnbltljlService().interfaceHlhtZybcjlYnbltljl(entity);
            //27.转科记录数据集表*  --陈蒯
            List<MbzDataCheck> mbzDataChecks27 = facade.getHlhtZybcjlZkjlService().interfaceHlhtZybcjlZkjl(entity);
            //28.转诊(院)记录数据集表* --陈蒯  (暂时不处理)
            List<MbzDataCheck> mbzDataChecks28 = facade.getHlhtZzyjlZzyjlService().interfaceHlhtZzyjlZzyjl(entity);
            //29.特殊检查及特殊治疗同意书* --陈世杰
            List<MbzDataCheck> mbzDataChecks29 = facade.getHlhtZqgzxxTsjczltysService().interfaceHlhtZqgzxxTsjczltys(entity);
            //30.输血记录表* --陈枫
            List<MbzDataCheck> mbzDataChecks30 = facade.getHlhtZlczjlSxjlService().interfaceHlhtZlczjlSxjl(entity);
            //31.门急诊病历记录表* --陈蒯
            List<MbzDataCheck> mbzDataChecks31 = facade.getHlhtMjzblMjzblService().interfaceHlhtMjzblMjzbl(entity);
            //32.急诊留观病历记录表*   --陈世杰
            List<MbzDataCheck> mbzDataChecks32 = facade.getHlhtMjzblJzlgblService().interfaceHlhtMjzblJzlgbl(entity);
            //33.治疗记录表* --陈枫
            List<MbzDataCheck> mbzDataChecks33 = facade.getHlhtZlczjlZljlService().interfaceHlhtZlczjlZljl(entity);
            //34.阴道分娩记录表*  --陈枫（暂时不处理）
            List<MbzDataCheck> mbzDataChecks34 = facade.getHlhtZcjlYdfmService().interfaceHlhtZcjlYdfm(entity);
            //35.剖宫产记录表* --陈蒯
            List<MbzDataCheck> mbzDataChecks35 = facade.getHlhtZcjlPgcService().interfaceHlhtZcjlPgc(entity);
            //非病历抽取
            //36.基本健康信息表* --陈世杰
            List<MbzDataCheck> mbzDataCheck36 = facade.getHlhtBlgyJbjkxxService().interfaceHlhtBlgyJbjkxx(entity);
            //38.西药处方记录表* --陈世杰
            List<MbzDataCheck> mbzDataCheck38 = facade.getHlhtMjzcfXycfService().interfaceHlhtMjzcfXycf(entity);
            //39.中药处方记录表* --陈枫
            List<MbzDataCheck> mbzDataChecks39 = facade.getHlhtMjzcfZycfService().interfaceHlhtMjzcfZycf(entity);
            //37.卫生事件摘要表* --陈蒯
            MbzDataCheck mbzDataCheck37 = facade.getHlhtBlgyWssjzyService().interfaceHlhtBlgyWssjzy(entity);
            facade.getHlhtZybcjlScbcjlService().selectAllHandleQuery();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
