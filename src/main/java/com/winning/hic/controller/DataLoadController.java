package com.winning.hic.controller;

import com.winning.hic.model.MbzDataCheck;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DataLoadController extends BaseController {
    private final Logger logger = LoggerFactory.getLogger(RyjlJbxxExtractController.class);

    @RequestMapping("/dataLoad/index")
    public String index() {
        //数据抽取
        try {
            //删除原来的检验结果
            super.getFacade().getMbzDataCheckService().removeMbzDataCheckList();

            //1. 24h内入出院记录  --陈世杰
            List<MbzDataCheck> mbzDataCheck1 = super.getFacade().getHlhtRyjlRcyjlService().interfaceHlhtRyjlRcyjl(null);
            //2. 24h内入院死亡记录*  -- 陈世杰
            List<MbzDataCheck> mbzDataCheck2 = super.getFacade().getHlhtRyjlRyswjlService().interfaceHlhtRyjlRyswjl(null);
            //3. 病危（重）通知书*  --陈枫
            List<MbzDataCheck> mbzDataChecks3 = super.getFacade().getHlhtZqgzxxBwztzsService().interfaceHlhtZqgzxxBwztzs();
            //4.出院记录数据集表* --陈枫
            List<MbzDataCheck> mbzDataChecks4 = super.getFacade().getHlhtZybcjlCyjlService().interfaceHlhtZybcjlCyjl();
            //5.入院记录* --陈枫
            List<MbzDataCheck> mbzDataChecks5 = super.getFacade().getHlhtRyjlJbxxService().interfaceHlhtRyjlJbxx();
            //6.首次病程记录表* --陈蒯
            MbzDataCheck mbzDataCheck6 = super.getFacade().getHlhtZybcjlScbcjlService().interfaceHlhtZybcjlScbcjl();
            //7.日常病程记录数据集表*  --陈枫
            List<MbzDataCheck> mbzDataChecks7 = getFacade().getHlhtZybcjlRcbcjlService().interfaceHlhtZybcjlRcbcjl();
            //8.交接班记录数据集表(医院一般不在病历里面写交接班记录，CIS有一个交接班的功能)*    --陈蒯（暂时不处理）
            List<MbzDataCheck> mbzDataChecks8 = super.getFacade().getHlhtZybcjlJjbjlService().interfaceHlhtZybcjlJjbjl();
            //9.--阶段小结数据集表*   --陈蒯
            List<MbzDataCheck> mbzDataChecks9 = super.getFacade().getHlhtZybcjlJdxjService().interfaceHlhtZybcjlJdxj();
            //10.抢救记录数据集表*  --陈蒯
            List<MbzDataCheck> mbzDataChecks10 = super.getFacade().getHlhtZybcjlQjjlService().interfaceHlhtZybcjlQjjl();
            //11.术后首次病程记录数据集表* --- 陈世杰
            List<MbzDataCheck> mbzDataChecks11 = super.getFacade().getHlhtZybcjlShscbcjlService().interfaceHlhtZybcjlShscbcjl(null);
            //12.术前小结数据集表* --- 陈世杰
            List<MbzDataCheck> mbzDataChecks12 = super.getFacade().getHlhtZybcjlSqxjService().interfaceHlhtZybcjlSqxj(null);
            //13.术前讨论数据集表*   --陈世杰
            List<MbzDataCheck> mbzDataChecks13 = super.getFacade().getHlhtZybcjlSqtlService().interfaceHlhtZybcjlSqtl(null);
            //14.死亡病历讨论记录数据集表* --陈世杰
            List<MbzDataCheck> mbzDataChecks14 = super.getFacade().getHlhtZybcjlSwbltljlService().interfaceHlhtZybcjlSwbltljl(null);
            //15.死亡记录数据集表*  --陈枫
            List<MbzDataCheck> mbzDataChecks15 = getFacade().getHlhtZybcjlSwjlService().interfaceHlhtZybcjlSwjl();
            //16.麻醉术前访视记录表(由手麻系统处理）* --陈枫（暂时不处理）
            List<MbzDataCheck> mbzDataChecks16 = getFacade().getHlhtZlczjlMzsqfsjlService().interfaceHlhtZlczjlMzsqfsjl();
            //17.麻醉术后访视记录表(由手麻系统处理)*   --陈枫（暂时不处理）
            List<MbzDataCheck> mbzDataChecks17 = getFacade().getHlhtZlczjlMzshfsjlService().interfaceHlhtZlczjlMzshfsjl();
            //18.麻醉知情同意书表* --陈枫
            List<MbzDataCheck> mbzDataChecks18 = getFacade().getHlhtZqgzxxMzzqtysService().interfaceHlhtZqgzxxMzzqtys();
            //19.其他知情告知同意书*  --陈蒯
            List<MbzDataCheck> mbzDataChecks19 = super.getFacade().getHlhtZqgzxxQtzqtysService().interfaceHlhtZqgzxxQtzqtys();
            //20.一般手术记录表(待定）*    --陈蒯
            List<MbzDataCheck> mbzDataChecks20 = super.getFacade().getHlhtZlczjlYbssjlService().interfaceHlhtZlczjlYbssjl();
            //21.会诊记录数据集表* --陈蒯
            List<MbzDataCheck> mbzDataChecks21 = super.getFacade().getHlhtZybcjlHzjlService().interfaceHlhtZybcjlHzjl();
            //22.出院小结数据集表*  --陈蒯
            List<MbzDataCheck> mbzDataChecks22 = super.getFacade().getHlhtCyxjCyxjService().interfaceHlhtCyxjCyxj();
            //23.上级医师查房记录数据集表*  --陈世杰
            List<MbzDataCheck> mbzDataChecks23 = super.getFacade().getHlhtZybcjlSjyscfjlService().interfaceHlhtZybcjlSjyscfjl(null);
            //24.手术知情同意书表*--陈世杰
            List<MbzDataCheck> mbzDataChecks24 = super.getFacade().getHlhtZqgzxxSstysService().interfaceHlhtZqgzxxSstys(null);
            //25.输血治疗同意书表* -- 陈枫
            List<MbzDataCheck> mbzDataChecks25 = getFacade().getHlhtZqgzxxSxzltysService().interfaceHlhtZqgzxxSxzltys();
            //26.疑难病例讨论数据集表* --陈枫
            List<MbzDataCheck> mbzDataChecks26 = getFacade().getHlhtZybcjlYnbltljlService().interfaceHlhtZybcjlYnbltljl();
            //27.转科记录数据集表*  --陈蒯
            List<MbzDataCheck> mbzDataChecks27 = super.getFacade().getHlhtZybcjlZkjlService().interfaceHlhtZybcjlZkjl();
            //28.转诊(院)记录数据集表* --陈蒯  (暂时不处理)
            List<MbzDataCheck> mbzDataChecks28 = super.getFacade().getHlhtZzyjlZzyjlService().interfaceHlhtZzyjlZzyjl();
            //29.特殊检查及特殊治疗同意书* --陈世杰
            List<MbzDataCheck> mbzDataChecks29 = super.getFacade().getHlhtZqgzxxTsjczltysService().interfaceHlhtZqgzxxTsjczltys(null);
            //30.输血记录表* --陈枫
            List<MbzDataCheck> mbzDataChecks30 = getFacade().getHlhtZlczjlSxjlService().interfaceHlhtZlczjlSxjl();
            //31.门急诊病历记录表* --陈蒯
            List<MbzDataCheck> mbzDataChecks31 = super.getFacade().getHlhtMjzblMjzblService().interfaceHlhtMjzblMjzbl();
            //32.急诊留观病历记录表*   --陈世杰
            List<MbzDataCheck> mbzDataChecks32 = super.getFacade().getHlhtMjzblJzlgblService().interfaceHlhtMjzblJzlgbl(null);
            //33.治疗记录表* --陈枫
            List<MbzDataCheck> mbzDataChecks33 = getFacade().getHlhtZlczjlZljlService().interfaceHlhtZlczjlZljl();
            //34.阴道分娩记录表*  --陈枫（暂时不处理）
            List<MbzDataCheck> mbzDataChecks34 = getFacade().getHlhtZcjlYdfmService().interfaceHlhtZcjlYdfm();
            //35.剖宫产记录表* --陈蒯
            List<MbzDataCheck> mbzDataChecks35 = super.getFacade().getHlhtZcjlPgcService().interfaceHlhtZcjlPgc();
            //非病历抽取
            //36.基本健康信息表* --陈世杰
            List<MbzDataCheck> mbzDataCheck36 = super.getFacade().getHlhtBlgyJbjkxxService().interfaceHlhtBlgyJbjkxx(null);
            //37.卫生事件摘要表* --陈蒯
            MbzDataCheck mbzDataCheck37 = super.getFacade().getHlhtBlgyWssjzyService().interfaceHlhtBlgyWssjzy();
            //38.西药处方记录表* --陈世杰
            List<MbzDataCheck> mbzDataCheck38 = super.getFacade().getHlhtMjzcfXycfService().interfaceHlhtMjzcfXycf(null);
            //39.中药处方记录表* --陈枫
            List<MbzDataCheck> mbzDataChecks39 = getFacade().getHlhtMjzcfZycfService().interfaceHlhtMjzcfZycf();


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/dataLoad/index";
    }


}
