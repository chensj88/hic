package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.model.HlhtRyjlRcyjl;
import com.winning.hic.model.HlhtRyjlRyswjl;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.model.MbzDataColumn;
import com.winning.hic.model.support.Row;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-09-10
 * Time: 10:14
 */
@RestController
public class DataDetailController extends BaseController {

    @ApiOperation(value = "/dataList/initColumns",notes = "根据数据源表获取字段信息")
    @ApiImplicitParam(
            name = "column",value = "字段信息",required = true,dataType = "MbzDataColumn"
    )
    @PostMapping(value = "/dataList/initColumns")
    public Map<String, Object> initColumns(MbzDataColumn column){
        //数据抽取
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("columns", super.getFacade().getMbzDataColumnService().getAllColumnsBySourceType(column));
        return result;
    }

    @ApiOperation(value = "/dataList/loadData",notes = "根据数据源表获取字段信息")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "sourceType",value = "源类型",required = true,dataType = "String"),
                    @ApiImplicitParam(name = "row",value = "分页参数",required = true,dataType = "Row"),
                    @ApiImplicitParam(name = "startDate",value = "开始日期",required = true,dataType = "String"),
                    @ApiImplicitParam(name = "endDate",value = "结束日期",required = true,dataType = "String")
            }
    )
    @GetMapping(value = "/dataList/loadData")
    public Map<String, Object>  queryLoadDataBySourceType(Long sourceType, Row row,String startDate, String endDate){
        Map<String, Object> params = new HashMap<>();
        params.put("startDate",startDate);
        params.put("endDate",endDate);
        //数据抽取
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        if(sourceType ==1){
            //1. 24h内入出院记录  --陈世杰
            HlhtRyjlRcyjl obj = new  HlhtRyjlRcyjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlPageList(obj));
            result.put("total",super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(obj));
        }else if(sourceType ==2){
            //2. 24h内入院死亡记录*  -- 陈世杰
            HlhtRyjlRyswjl obj = new  HlhtRyjlRyswjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",super.getFacade().getHlhtRyjlRyswjlService().getHlhtRyjlRyswjlPageList(obj));
            result.put("total",super.getFacade().getHlhtRyjlRyswjlService().getHlhtRyjlRyswjlCount(obj));
        }/*else if(sourceType ==3){
            //3. 病危（重）通知书*  --陈枫
            objects = super.getFacade().getHlhtZqgzxxBwztzsService().getHlhtZqgzxxBwztzsPageList(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==4){
            //4.出院记录数据集表* --陈枫
            objects = super.getFacade().getHlhtZybcjlCyjlService().getHlhtZybcjlCyjlPageList(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==5){
            //5.入院记录* --陈枫
            objects = super.getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxxPageList(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==6){
            //6.首次病程记录表* --陈蒯
            objects = super.getFacade().getHlhtZybcjlScbcjlService().interfaceHlhtZybcjlScbcjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==7){
            //7.日常病程记录数据集表*  --陈枫
            objects = getFacade().getHlhtZybcjlRcbcjlService().interfaceHlhtZybcjlRcbcjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==8){
            //8.交接班记录数据集表(医院一般不在病历里面写交接班记录，CIS有一个交接班的功能)*    --陈蒯（暂时不处理）
            objects = super.getFacade().getHlhtZybcjlJjbjlService().interfaceHlhtZybcjlJjbjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==9){
            //9.--阶段小结数据集表*   --陈蒯
            objects = super.getFacade().getHlhtZybcjlJdxjService().interfaceHlhtZybcjlJdxj(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==10){
            //10.抢救记录数据集表*  --陈蒯
            objects = super.getFacade().getHlhtZybcjlQjjlService().interfaceHlhtZybcjlQjjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==11){
            //11.术后首次病程记录数据集表* --- 陈世杰
            objects = super.getFacade().getHlhtZybcjlShscbcjlService().interfaceHlhtZybcjlShscbcjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==12){
            //12.术前小结数据集表* --- 陈世杰
            objects = super.getFacade().getHlhtZybcjlSqxjService().interfaceHlhtZybcjlSqxj(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==13){
            //13.术前讨论数据集表*   --陈世杰
            objects = super.getFacade().getHlhtZybcjlSqtlService().interfaceHlhtZybcjlSqtl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==14){
            //14.死亡病历讨论记录数据集表* --陈世杰
            objects = super.getFacade().getHlhtZybcjlSwbltljlService().interfaceHlhtZybcjlSwbltljl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==15){
            //15.死亡记录数据集表* --陈枫
            objects = getFacade().getHlhtZybcjlSwjlService().interfaceHlhtZybcjlSwjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==16){
            //16.麻醉术前访视记录表(由手麻系统处理）* --陈枫（暂时不处理）
            objects = getFacade().getHlhtZlczjlMzsqfsjlService().interfaceHlhtZlczjlMzsqfsjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==17){
            //17.麻醉术后访视记录表(由手麻系统处理)*   --陈枫（暂时不处理）
            objects = getFacade().getHlhtZlczjlMzshfsjlService().interfaceHlhtZlczjlMzshfsjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==18){
            //18.麻醉知情同意书表* --陈枫
            objects = getFacade().getHlhtZqgzxxMzzqtysService().interfaceHlhtZqgzxxMzzqtys(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==19){
            //19.其他知情告知同意书*  --陈蒯
            objects = super.getFacade().getHlhtZqgzxxQtzqtysService().interfaceHlhtZqgzxxQtzqtys(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==20){
            //20.一般手术记录表(待定）*    --陈蒯
            objects = super.getFacade().getHlhtZlczjlYbssjlService().interfaceHlhtZlczjlYbssjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==21){
            //21.会诊记录数据集表* --陈蒯
            objects = super.getFacade().getHlhtZybcjlHzjlService().interfaceHlhtZybcjlHzjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==22){
            //22.出院小结数据集表*  --陈蒯
            objects = super.getFacade().getHlhtCyxjCyxjService().interfaceHlhtCyxjCyxj(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==23){
            //23.上级医师查房记录数据集表*  --陈世杰
            objects = super.getFacade().getHlhtZybcjlSjyscfjlService().interfaceHlhtZybcjlSjyscfjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==24){
            //24.手术知情同意书表*--陈世杰
            objects = super.getFacade().getHlhtZqgzxxSstysService().interfaceHlhtZqgzxxSstys(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==25){
            //25.输血治疗同意书表* -- 陈枫
            objects = getFacade().getHlhtZqgzxxSxzltysService().interfaceHlhtZqgzxxSxzltys(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==26){
            //26.疑难病例讨论数据集表* --陈枫
            objects = getFacade().getHlhtZybcjlYnbltljlService().interfaceHlhtZybcjlYnbltljl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==27){
            //27.转科记录数据集表*  --陈蒯
            objects = super.getFacade().getHlhtZybcjlZkjlService().interfaceHlhtZybcjlZkjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==28){
            //28.转诊(院)记录数据集表* --陈蒯  (暂时不处理)
            objects = super.getFacade().getHlhtZzyjlZzyjlService().interfaceHlhtZzyjlZzyjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==29){
            //29.特殊检查及特殊治疗同意书* --陈世杰
            objects = super.getFacade().getHlhtZqgzxxTsjczltysService().interfaceHlhtZqgzxxTsjczltys(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==30){
            //30.输血记录表* --陈枫
            objects = getFacade().getHlhtZlczjlSxjlService().interfaceHlhtZlczjlSxjl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==31){
            //31.门急诊病历记录表* --陈蒯
            objects = super.getFacade().getHlhtMjzblMjzblService().interfaceHlhtMjzblMjzbl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==32){
            //32.急诊留观病历记录表*   --陈世杰
            objects = super.getFacade().getHlhtMjzblJzlgblService().interfaceHlhtMjzblJzlgbl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==33){
            //33.治疗记录表* --陈枫
            objects = getFacade().getHlhtZlczjlZljlService().interfaceHlhtZlczjlZljl(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==34){
            //34.阴道分娩记录表*  --陈枫（暂时不处理）
            objects = getFacade().getHlhtZcjlYdfmService().interfaceHlhtZcjlYdfm(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==35){
            //35.剖宫产记录表* --陈蒯
            objects = super.getFacade().getHlhtZcjlPgcService().interfaceHlhtZcjlPgc(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==36){
            //36.基本健康信息表* --陈世杰
            objects = super.getFacade().getHlhtBlgyJbjkxxService().interfaceHlhtBlgyJbjkxx(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==37){
            //37.卫生事件摘要表* --陈蒯
            objects = super.getFacade().getHlhtBlgyWssjzyService().interfaceHlhtBlgyWssjzy();
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==38){
            //38.西药处方记录表* --陈世杰
            objects = super.getFacade().getHlhtMjzcfXycfService().interfaceHlhtMjzcfXycf(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }else if(sourceType ==39){
            //39.中药处方记录表* --陈枫
            objects = getFacade().getHlhtMjzcfZycfService().interfaceHlhtMjzcfZycf(params);
            total = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(params);
        }*/

        return result;
    }

}
