package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.model.*;
import com.winning.hic.model.support.Row;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping(value = "/dataList")
public class DataDetailController extends BaseController {

    /**
     * 分页加载查询数据
     * @param dataInfo
     * @param row
     * @param startDate
     * @param endDate
     * @return
     */
    @ApiOperation(value = "/dataList/loadList",notes = "分页方法")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataInfo",value = "字段信息",required = true,dataType = "MbzDataColumn"),
                    @ApiImplicitParam(name = "row",value = "分页参数",required = true,dataType = "Row"),
                    @ApiImplicitParam(name = "startDate",value = "开始日期",required = true,dataType = "String"),
                    @ApiImplicitParam(name = "endDate",value = "结束日期",required = true,dataType = "String")
            }
    )
    @PostMapping(value = "/loadList")
    public Map<String, Object> loadMbzLoadDataInfo(MbzLoadDataInfo dataInfo,Row row,String startDate, String endDate){
        dataInfo.setRow(row);
        Map<String,Object> params = dataInfo.getMap();
        params.put("startDate",startDate);
        params.put("endDate",endDate);
        //数据抽取
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("rows", super.getFacade().getMbzLoadDataInfoService().getMbzLoadDataInfoPageList(dataInfo));
        result.put("total", super.getFacade().getMbzLoadDataInfoService().getMbzLoadDataInfoCount(dataInfo));
        return result;
    }

    @ApiOperation(value = "/dataList/initColumns",notes = "根据数据源表获取字段信息")
    @ApiImplicitParam(
            name = "column",value = "字段信息",required = true,dataType = "MbzDataColumn"
    )
    @PostMapping(value = "/initColumns")
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
    @GetMapping(value = "/loadData")
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
        }else if(sourceType ==3){
            //3. 病危（重）通知书*  --陈枫
            HlhtZqgzxxBwztzs obj = new HlhtZqgzxxBwztzs();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZqgzxxBwztzsService().getHlhtZqgzxxBwztzsPageList(obj));
            result.put("total",getFacade().getHlhtZqgzxxBwztzsService().getHlhtZqgzxxBwztzsCount(obj));
        }else if(sourceType ==4){
            //4.出院记录数据集表* --陈枫
            HlhtZybcjlCyjl obj = new HlhtZybcjlCyjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlCyjlService().getHlhtZybcjlCyjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlCyjlService().getHlhtZybcjlCyjlCount(obj));
        }else if(sourceType ==5){
            //5.入院记录* --陈枫
            HlhtRyjlJbxx obj = new HlhtRyjlJbxx();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxxPageList(obj));
            result.put("total",getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxxCount(obj));
        }else if(sourceType ==6){
            //6.首次病程记录表* --陈蒯
            HlhtZybcjlScbcjl obj = new HlhtZybcjlScbcjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlScbcjlService().getHlhtZybcjlScbcjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlScbcjlService().getHlhtZybcjlScbcjlCount(obj));
        }else if(sourceType ==7){
            //7.日常病程记录数据集表*  --陈枫
            HlhtZybcjlRcbcjl obj = new HlhtZybcjlRcbcjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlRcbcjlService().getHlhtZybcjlRcbcjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlRcbcjlService().getHlhtZybcjlRcbcjlCount(obj));

        }else if(sourceType ==8){
            //8.交接班记录数据集表(医院一般不在病历里面写交接班记录，CIS有一个交接班的功能)*    --陈蒯（暂时不处理）
            HlhtZybcjlJjbjl obj = new HlhtZybcjlJjbjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlJjbjlService().getHlhtZybcjlJjbjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlJjbjlService().getHlhtZybcjlJjbjlCount(obj));
        }else if(sourceType ==9){
            //9.--阶段小结数据集表*   --陈蒯
            HlhtZybcjlJdxj obj = new HlhtZybcjlJdxj();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlJdxjService().getHlhtZybcjlJdxjPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlJdxjService().getHlhtZybcjlJdxjCount(obj));
        }else if(sourceType ==10){
            //10.抢救记录数据集表*  --陈蒯
            HlhtZybcjlQjjl obj = new HlhtZybcjlQjjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlQjjlService().getHlhtZybcjlQjjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlQjjlService().getHlhtZybcjlQjjlCount(obj));
        }else if(sourceType ==11){
            //11.术后首次病程记录数据集表* --- 陈世杰
            HlhtZybcjlShscbcjl obj = new HlhtZybcjlShscbcjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlShscbcjlService().getHlhtZybcjlShscbcjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlShscbcjlService().getHlhtZybcjlShscbcjlCount(obj));

        }else if(sourceType ==12){
            //12.术前小结数据集表* --- 陈世杰
            HlhtZybcjlSqxj obj = new HlhtZybcjlSqxj();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlSqxjService().getHlhtZybcjlSqxjPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlSqxjService().getHlhtZybcjlSqxjCount(obj));
        }else if(sourceType ==13){
            //13.术前讨论数据集表*   --陈世杰
            HlhtZybcjlSqtl obj = new HlhtZybcjlSqtl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlSqtlService().getHlhtZybcjlSqtlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlSqtlService().getHlhtZybcjlSqtlCount(obj));

        }else if(sourceType ==14){
            //14.死亡病历讨论记录数据集表* --陈世杰
            HlhtZybcjlSwbltljl obj = new HlhtZybcjlSwbltljl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlSwbltljlService().getHlhtZybcjlSwbltljlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlSwbltljlService().getHlhtZybcjlSwbltljlCount(obj));

        }else if(sourceType ==15){
            //15.死亡记录数据集表* --陈枫
            HlhtZybcjlSwjl obj = new HlhtZybcjlSwjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZybcjlSwjlService().getHlhtZybcjlSwjlPageList(obj));
            result.put("total",getFacade().getHlhtZybcjlSwjlService().getHlhtZybcjlSwjlCount(obj));

        }/*else if(sourceType ==16){
            //16.麻醉术前访视记录表(由手麻系统处理）* --陈枫（暂时不处理）
            obj.setRow(row);
            obj.setMap(params);
 = getFacade().getHlhtZlczjlMzsqfsjlService().interfaceHlhtZlczjlMzsqfsjl(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==17){
            //17.麻醉术后访视记录表(由手麻系统处理)*   --陈枫（暂时不处理）
            obj.setRow(row);
            obj.setMap(params);
 = getFacade().getHlhtZlczjlMzshfsjlService().interfaceHlhtZlczjlMzshfsjl(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==18){
            //18.麻醉知情同意书表* --陈枫
            obj.setRow(row);
            obj.setMap(params);
 = getFacade().getHlhtZqgzxxMzzqtysService().interfaceHlhtZqgzxxMzzqtys(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==19){
            //19.其他知情告知同意书*  --陈蒯
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtZqgzxxQtzqtysService().interfaceHlhtZqgzxxQtzqtys(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==20){
            //20.一般手术记录表(待定）*    --陈蒯
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtZlczjlYbssjlService().interfaceHlhtZlczjlYbssjl(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==21){
            //21.会诊记录数据集表* --陈蒯
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtZybcjlHzjlService().interfaceHlhtZybcjlHzjl(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==22){
            //22.出院小结数据集表*  --陈蒯
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtCyxjCyxjService().interfaceHlhtCyxjCyxj(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==23){
            //23.上级医师查房记录数据集表*  --陈世杰
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtZybcjlSjyscfjlService().interfaceHlhtZybcjlSjyscfjl(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==24){
            //24.手术知情同意书表*--陈世杰
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtZqgzxxSstysService().interfaceHlhtZqgzxxSstys(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==25){
            //25.输血治疗同意书表* -- 陈枫
            obj.setRow(row);
            obj.setMap(params);
 = getFacade().getHlhtZqgzxxSxzltysService().interfaceHlhtZqgzxxSxzltys(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==26){
            //26.疑难病例讨论数据集表* --陈枫
            obj.setRow(row);
            obj.setMap(params);
 = getFacade().getHlhtZybcjlYnbltljlService().interfaceHlhtZybcjlYnbltljl(params);
            result.put("rows",);
            result.put("total",);

        }else if(sourceType ==27){
            //27.转科记录数据集表*  --陈蒯
            obj.setRow(row);
            obj.setMap(params);
 = super.getFacade().getHlhtZybcjlZkjlService().interfaceHlhtZybcjlZkjl(params);
            result.put("rows",);
            result.put("total",);

        }*/else if(sourceType ==28){
            //28.转诊(院)记录数据集表* --陈蒯  (暂时不处理)
            HlhtZzyjlZzyjl obj = new HlhtZzyjlZzyjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZzyjlZzyjlService().getHlhtZzyjlZzyjlPageList(obj));
            result.put("total",getFacade().getHlhtZzyjlZzyjlService().getHlhtZzyjlZzyjlCount(obj));
        }else if(sourceType ==29){
            //29.特殊检查及特殊治疗同意书* --陈世杰
            HlhtZqgzxxTsjczltys obj = new HlhtZqgzxxTsjczltys();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZqgzxxTsjczltysService().getHlhtZqgzxxTsjczltysPageList(obj));
            result.put("total",getFacade().getHlhtZqgzxxTsjczltysService().getHlhtZqgzxxTsjczltysCount(obj));
        }else if(sourceType ==30){
            //30.输血记录表* --陈枫
            HlhtZlczjlSxjl obj = new HlhtZlczjlSxjl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZlczjlSxjlService().getHlhtZlczjlSxjlPageList(obj));
            result.put("total",getFacade().getHlhtZlczjlSxjlService().getHlhtZlczjlSxjlCount(obj));
        }else if(sourceType ==31){
            //31.门急诊病历记录表* --陈蒯
            HlhtMjzblMjzbl obj = new HlhtMjzblMjzbl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtMjzblMjzblService().getHlhtMjzblMjzblPageList(obj));
            result.put("total",getFacade().getHlhtMjzblMjzblService().getHlhtMjzblMjzblCount(obj));
        }else if(sourceType ==32){
            //32.急诊留观病历记录表*   --陈世杰
            HlhtMjzblJzlgbl obj = new HlhtMjzblJzlgbl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtMjzblJzlgblService().getHlhtMjzblJzlgblPageList(obj));
            result.put("total",getFacade().getHlhtMjzblJzlgblService().getHlhtMjzblJzlgblCount(obj));
        }else if(sourceType ==33){
            //33.治疗记录表* --陈枫
            HlhtZlczjlZljl obj = new HlhtZlczjlZljl();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZlczjlZljlService().getHlhtZlczjlZljlPageList(obj));
            result.put("total",getFacade().getHlhtZlczjlZljlService().getHlhtZlczjlZljlCount(obj));
        }else if(sourceType ==34){
            //34.阴道分娩记录表*  --陈枫（暂时不处理）
            HlhtZcjlYdfm obj = new HlhtZcjlYdfm();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtZcjlYdfmService().getHlhtZcjlYdfmPageList(obj));
            result.put("total",getFacade().getHlhtZcjlYdfmService().getHlhtZcjlYdfmCount(obj));
        }else if(sourceType ==35){
            //35.剖宫产记录表* --陈蒯
            HlhtZcjlPgc obj = new HlhtZcjlPgc();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",super.getFacade().getHlhtZcjlPgcService().getHlhtZcjlPgcPageList(obj));
            result.put("total",super.getFacade().getHlhtZcjlPgcService().getHlhtZcjlPgcCount(obj));
        }else if(sourceType ==36){
            //36.基本健康信息表* --陈世杰
            HlhtBlgyJbjkxx obj = new HlhtBlgyJbjkxx();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtBlgyJbjkxxService().getHlhtBlgyJbjkxxPageList(obj));
            result.put("total",getFacade().getHlhtBlgyJbjkxxService().getHlhtBlgyJbjkxxCount(obj));
        }else if(sourceType ==37){
            //37.卫生事件摘要表* --陈蒯
            HlhtBlgyWssjzy obj = new HlhtBlgyWssjzy();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtBlgyWssjzyService().getHlhtBlgyWssjzyPageList(obj));
            result.put("total",getFacade().getHlhtBlgyWssjzyService().getHlhtBlgyWssjzyCount(obj));
        }else if(sourceType ==38){
            //38.西药处方记录表* --陈世杰
            HlhtMjzcfXycf obj = new HlhtMjzcfXycf();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtMjzcfXycfService().getHlhtMjzcfXycfPageList(obj));
            result.put("total",getFacade().getHlhtMjzcfXycfService().getHlhtMjzcfXycfCount(obj));
        }else if(sourceType ==39){
            //39.中药处方记录表* --陈枫
            HlhtMjzcfZycf obj = new HlhtMjzcfZycf();
            obj.setRow(row);
            obj.setMap(params);
            result.put("rows",getFacade().getHlhtMjzcfZycfService().getHlhtMjzcfZycfPageList(obj));
            result.put("total",getFacade().getHlhtMjzcfZycfService().getHlhtMjzcfZycfCount(obj));
        }

        return result;
    }

}
