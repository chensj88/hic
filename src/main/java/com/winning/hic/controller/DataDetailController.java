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
@RequestMapping(value = "/data")
public class DataDetailController extends BaseController {

    /**
     * 分页加载查询数据
     *
     * @param dataInfo
     * @param row
     * @param startDate
     * @param endDate
     * @return
     */
    @ApiOperation(value = "/data/load", notes = "分页方法")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataInfo", value = "字段信息", required = true, dataType = "MbzDataColumn"),
                    @ApiImplicitParam(name = "row", value = "分页参数", required = true, dataType = "Row"),
                    @ApiImplicitParam(name = "startDate", value = "开始日期", required = true, dataType = "String"),
                    @ApiImplicitParam(name = "endDate", value = "结束日期", required = true, dataType = "String")
            }
    )
    @GetMapping(value = "/load")
    public Map<String, Object> loadMbzLoadDataInfo(MbzLoadDataInfo dataInfo, Row row, String startDate, String endDate) {
        dataInfo.setRow(row);
        Map<String, Object> params = dataInfo.getMap();
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        //数据抽取
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("rows", super.getFacade().getMbzLoadDataInfoService().getMbzLoadDataInfoPageList(dataInfo));
        result.put("total", super.getFacade().getMbzLoadDataInfoService().getMbzLoadDataInfoCount(dataInfo));
        return result;
    }

    @ApiOperation(value = "/data/initColumns", notes = "根据数据源表获取字段信息")
    @ApiImplicitParam(
            name = "column", value = "字段信息", required = true, dataType = "MbzDataColumn"
    )
    @PostMapping(value = "/initColumns")
    public Map<String, Object> initColumns(MbzLoadDataInfo dataInfo) {
        MbzDataColumn column = new MbzDataColumn();
        column.setSourceType(dataInfo.getSourceType());
        //数据抽取
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("columns", super.getFacade().getMbzDataColumnService().getAllColumnsBySourceType(column));
        getLoadDataBySourceType(dataInfo, result);
        return result;
    }

    private Map<String, Object> getLoadDataBySourceType(MbzLoadDataInfo dataInfo, Map<String, Object> result) {
        Long sourceType = dataInfo.getSourceType();
        String yjlxh = dataInfo.getSourceId() + "";
        if (sourceType == 1) {
            //1. 24h内入出院记录  --陈世杰
            HlhtRyjlRcyjl obj = new HlhtRyjlRcyjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjl(obj));
            result.put("total", super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjlCount(obj));
        } else if (sourceType == 2) {
            //2. 24h内入院死亡记录*  -- 陈世杰
            HlhtRyjlRyswjl obj = new HlhtRyjlRyswjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", super.getFacade().getHlhtRyjlRyswjlService().getHlhtRyjlRyswjl(obj));
            result.put("total", super.getFacade().getHlhtRyjlRyswjlService().getHlhtRyjlRyswjlCount(obj));
        } else if (sourceType == 3) {
            //3. 病危（重）通知书*  --陈枫
            HlhtZqgzxxBwztzs obj = new HlhtZqgzxxBwztzs();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZqgzxxBwztzsService().getHlhtZqgzxxBwztzs(obj));
            result.put("total", getFacade().getHlhtZqgzxxBwztzsService().getHlhtZqgzxxBwztzsCount(obj));
        } else if (sourceType == 4) {
            //4.出院记录数据集表* --陈枫
            HlhtZybcjlCyjl obj = new HlhtZybcjlCyjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlCyjlService().getHlhtZybcjlCyjl(obj));
            result.put("total", getFacade().getHlhtZybcjlCyjlService().getHlhtZybcjlCyjlCount(obj));
        } else if (sourceType == 5) {
            //5.入院记录* --陈枫
            HlhtRyjlJbxx obj = new HlhtRyjlJbxx();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxx(obj));
            result.put("total", getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxxCount(obj));
        } else if (sourceType == 6) {
            //6.首次病程记录表* --陈蒯
            HlhtZybcjlScbcjl obj = new HlhtZybcjlScbcjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlScbcjlService().getHlhtZybcjlScbcjl(obj));
            result.put("total", getFacade().getHlhtZybcjlScbcjlService().getHlhtZybcjlScbcjlCount(obj));
        } else if (sourceType == 7) {
            //7.日常病程记录数据集表*  --陈枫
            HlhtZybcjlRcbcjl obj = new HlhtZybcjlRcbcjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlRcbcjlService().getHlhtZybcjlRcbcjl(obj));
            result.put("total", getFacade().getHlhtZybcjlRcbcjlService().getHlhtZybcjlRcbcjlCount(obj));

        } else if (sourceType == 8) {
            //8.交接班记录数据集表(医院一般不在病历里面写交接班记录，CIS有一个交接班的功能)*    --陈蒯（暂时不处理）
            HlhtZybcjlJjbjl obj = new HlhtZybcjlJjbjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlJjbjlService().getHlhtZybcjlJjbjl(obj));
            result.put("total", getFacade().getHlhtZybcjlJjbjlService().getHlhtZybcjlJjbjlCount(obj));
        } else if (sourceType == 9) {
            //9.--阶段小结数据集表*   --陈蒯
            HlhtZybcjlJdxj obj = new HlhtZybcjlJdxj();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlJdxjService().getHlhtZybcjlJdxj(obj));
            result.put("total", getFacade().getHlhtZybcjlJdxjService().getHlhtZybcjlJdxjCount(obj));
        } else if (sourceType == 10) {
            //10.抢救记录数据集表*  --陈蒯
            HlhtZybcjlQjjl obj = new HlhtZybcjlQjjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlQjjlService().getHlhtZybcjlQjjl(obj));
            result.put("total", getFacade().getHlhtZybcjlQjjlService().getHlhtZybcjlQjjlCount(obj));
        } else if (sourceType == 11) {
            //11.术后首次病程记录数据集表* --- 陈世杰
            HlhtZybcjlShscbcjl obj = new HlhtZybcjlShscbcjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlShscbcjlService().getHlhtZybcjlShscbcjl(obj));
            result.put("total", getFacade().getHlhtZybcjlShscbcjlService().getHlhtZybcjlShscbcjlCount(obj));

        } else if (sourceType == 12) {
            //12.术前小结数据集表* --- 陈世杰
            HlhtZybcjlSqxj obj = new HlhtZybcjlSqxj();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlSqxjService().getHlhtZybcjlSqxj(obj));
            result.put("total", getFacade().getHlhtZybcjlSqxjService().getHlhtZybcjlSqxjCount(obj));
        } else if (sourceType == 13) {
            //13.术前讨论数据集表*   --陈世杰
            HlhtZybcjlSqtl obj = new HlhtZybcjlSqtl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlSqtlService().getHlhtZybcjlSqtl(obj));
            result.put("total", getFacade().getHlhtZybcjlSqtlService().getHlhtZybcjlSqtlCount(obj));

        } else if (sourceType == 14) {
            //14.死亡病历讨论记录数据集表* --陈世杰
            HlhtZybcjlSwbltljl obj = new HlhtZybcjlSwbltljl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlSwbltljlService().getHlhtZybcjlSwbltljl(obj));
            result.put("total", getFacade().getHlhtZybcjlSwbltljlService().getHlhtZybcjlSwbltljlCount(obj));

        } else if (sourceType == 15) {
            //15.死亡记录数据集表* --陈枫
            HlhtZybcjlSwjl obj = new HlhtZybcjlSwjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlSwjlService().getHlhtZybcjlSwjl(obj));
            result.put("total", getFacade().getHlhtZybcjlSwjlService().getHlhtZybcjlSwjlCount(obj));

        } else if (sourceType == 16) {
            //16.麻醉术前访视记录表(由手麻系统处理）* --陈枫（暂时不处理）
            HlhtZlczjlMzsqfsjl obj = new HlhtZlczjlMzsqfsjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZlczjlMzsqfsjlService().getHlhtZlczjlMzsqfsjl(obj));
            result.put("total", getFacade().getHlhtZlczjlMzsqfsjlService().getHlhtZlczjlMzsqfsjlCount(obj));

        } else if (sourceType == 17) {
            //17.麻醉术后访视记录表(由手麻系统处理)*   --陈枫（暂时不处理）
            HlhtZlczjlMzshfsjl obj = new HlhtZlczjlMzshfsjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZlczjlMzshfsjlService().getHlhtZlczjlMzshfsjl(obj));
            result.put("total", getFacade().getHlhtZlczjlMzshfsjlService().getHlhtZlczjlMzshfsjlCount(obj));
        } else if (sourceType == 18) {
            //18.麻醉知情同意书表* --陈枫
            HlhtZqgzxxMzzqtys obj = new HlhtZqgzxxMzzqtys();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZqgzxxMzzqtysService().getHlhtZqgzxxMzzqtys(obj));
            result.put("total", getFacade().getHlhtZqgzxxMzzqtysService().getHlhtZqgzxxMzzqtysCount(obj));

        } else if (sourceType == 19) {
            //19.其他知情告知同意书*  --陈蒯
            HlhtZqgzxxQtzqtys obj = new HlhtZqgzxxQtzqtys();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZqgzxxQtzqtysService().getHlhtZqgzxxQtzqtys(obj));
            result.put("total", getFacade().getHlhtZqgzxxQtzqtysService().getHlhtZqgzxxQtzqtysCount(obj));

        } else if (sourceType == 20) {
            //20.一般手术记录表(待定）*    --陈蒯
            HlhtZlczjlYbssjl obj = new HlhtZlczjlYbssjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZlczjlYbssjlService().getHlhtZlczjlYbssjl(obj));
            result.put("total", getFacade().getHlhtZlczjlYbssjlService().getHlhtZlczjlYbssjlCount(obj));

        } else if (sourceType == 21) {
            //21.会诊记录数据集表* --陈蒯
            HlhtZybcjlHzjl obj = new HlhtZybcjlHzjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlHzjlService().getHlhtZybcjlHzjl(obj));
            result.put("total", getFacade().getHlhtZybcjlHzjlService().getHlhtZybcjlHzjlCount(obj));

        } else if (sourceType == 22) {
            //22.出院小结数据集表*  --陈蒯
            HlhtCyxjCyxj obj = new HlhtCyxjCyxj();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtCyxjCyxjService().getHlhtCyxjCyxj(obj));
            result.put("total", getFacade().getHlhtCyxjCyxjService().getHlhtCyxjCyxjCount(obj));

        } else if (sourceType == 23) {
            //23.上级医师查房记录数据集表*  --陈世杰
            HlhtZybcjlSjyscfjl obj = new HlhtZybcjlSjyscfjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlSjyscfjlService().getHlhtZybcjlSjyscfjl(obj));
            result.put("total", getFacade().getHlhtZybcjlSjyscfjlService().getHlhtZybcjlSjyscfjlCount(obj));

        } else if (sourceType == 24) {
            //24.手术知情同意书表*--陈世杰
            HlhtZqgzxxSstys obj = new HlhtZqgzxxSstys();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZqgzxxSstysService().getHlhtZqgzxxSstys(obj));
            result.put("total", getFacade().getHlhtZqgzxxSstysService().getHlhtZqgzxxSstysCount(obj));

        } else if (sourceType == 25) {
            //25.输血治疗同意书表* -- 陈枫
            HlhtZqgzxxSxzltys obj = new HlhtZqgzxxSxzltys();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZqgzxxSxzltysService().getHlhtZqgzxxSxzltys(obj));
            result.put("total", getFacade().getHlhtZqgzxxSxzltysService().getHlhtZqgzxxSxzltysCount(obj));

        } else if (sourceType == 26) {
            //26.疑难病例讨论数据集表* --陈枫
            HlhtZybcjlYnbltljl obj = new HlhtZybcjlYnbltljl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlYnbltljlService().getHlhtZybcjlYnbltljl(obj));
            result.put("total", getFacade().getHlhtZybcjlYnbltljlService().getHlhtZybcjlYnbltljlCount(obj));

        } else if (sourceType == 27) {
            //27.转科记录数据集表*  --陈蒯
            HlhtZybcjlZkjl obj = new HlhtZybcjlZkjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZybcjlZkjlService().getHlhtZybcjlZkjl(obj));
            result.put("total", getFacade().getHlhtZybcjlZkjlService().getHlhtZybcjlZkjlCount(obj));

        } else if (sourceType == 28) {
            //28.转诊(院)记录数据集表* --陈蒯  (暂时不处理)
            HlhtZzyjlZzyjl obj = new HlhtZzyjlZzyjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZzyjlZzyjlService().getHlhtZzyjlZzyjl(obj));
            result.put("total", getFacade().getHlhtZzyjlZzyjlService().getHlhtZzyjlZzyjlCount(obj));
        } else if (sourceType == 29) {
            //29.特殊检查及特殊治疗同意书* --陈世杰
            HlhtZqgzxxTsjczltys obj = new HlhtZqgzxxTsjczltys();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZqgzxxTsjczltysService().getHlhtZqgzxxTsjczltys(obj));
            result.put("total", getFacade().getHlhtZqgzxxTsjczltysService().getHlhtZqgzxxTsjczltysCount(obj));
        } else if (sourceType == 30) {
            //30.输血记录表* --陈枫
            HlhtZlczjlSxjl obj = new HlhtZlczjlSxjl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZlczjlSxjlService().getHlhtZlczjlSxjl(obj));
            result.put("total", getFacade().getHlhtZlczjlSxjlService().getHlhtZlczjlSxjlCount(obj));
        } else if (sourceType == 31) {
            //31.门急诊病历记录表* --陈蒯
            HlhtMjzblMjzbl obj = new HlhtMjzblMjzbl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtMjzblMjzblService().getHlhtMjzblMjzbl(obj));
            result.put("total", getFacade().getHlhtMjzblMjzblService().getHlhtMjzblMjzblCount(obj));
        } else if (sourceType == 32) {
            //32.急诊留观病历记录表*   --陈世杰
            HlhtMjzblJzlgbl obj = new HlhtMjzblJzlgbl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtMjzblJzlgblService().getHlhtMjzblJzlgbl(obj));
            result.put("total", getFacade().getHlhtMjzblJzlgblService().getHlhtMjzblJzlgblCount(obj));
        } else if (sourceType == 33) {
            //33.治疗记录表* --陈枫
            HlhtZlczjlZljl obj = new HlhtZlczjlZljl();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZlczjlZljlService().getHlhtZlczjlZljl(obj));
            result.put("total", getFacade().getHlhtZlczjlZljlService().getHlhtZlczjlZljlCount(obj));
        } else if (sourceType == 34) {
            //34.阴道分娩记录表*  --陈枫（暂时不处理）
            HlhtZcjlYdfm obj = new HlhtZcjlYdfm();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtZcjlYdfmService().getHlhtZcjlYdfm(obj));
            result.put("total", getFacade().getHlhtZcjlYdfmService().getHlhtZcjlYdfmCount(obj));
        } else if (sourceType == 35) {
            //35.剖宫产记录表* --陈蒯
            HlhtZcjlPgc obj = new HlhtZcjlPgc();

            obj.setYjlxh(yjlxh);

            result.put("rows", super.getFacade().getHlhtZcjlPgcService().getHlhtZcjlPgc(obj));
            result.put("total", super.getFacade().getHlhtZcjlPgcService().getHlhtZcjlPgcCount(obj));
        } else if (sourceType == 36) {
            //36.基本健康信息表* --陈世杰
            HlhtBlgyJbjkxx obj = new HlhtBlgyJbjkxx();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtBlgyJbjkxxService().getHlhtBlgyJbjkxx(obj));
            result.put("total", getFacade().getHlhtBlgyJbjkxxService().getHlhtBlgyJbjkxxCount(obj));
        } else if (sourceType == 37) {
            //37.卫生事件摘要表* --陈蒯
            HlhtBlgyWssjzy obj = new HlhtBlgyWssjzy();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtBlgyWssjzyService().getHlhtBlgyWssjzy(obj));
            result.put("total", getFacade().getHlhtBlgyWssjzyService().getHlhtBlgyWssjzyCount(obj));
        } else if (sourceType == 38) {
            //38.西药处方记录表* --陈世杰
            HlhtMjzcfXycf obj = new HlhtMjzcfXycf();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtMjzcfXycfService().getHlhtMjzcfXycf(obj));
            result.put("total", getFacade().getHlhtMjzcfXycfService().getHlhtMjzcfXycfCount(obj));
        } else if (sourceType == 39) {
            //39.中药处方记录表* --陈枫
            HlhtMjzcfZycf obj = new HlhtMjzcfZycf();

            obj.setYjlxh(yjlxh);

            result.put("rows", getFacade().getHlhtMjzcfZycfService().getHlhtMjzcfZycf(obj));
            result.put("total", getFacade().getHlhtMjzcfZycfService().getHlhtMjzcfZycfCount(obj));
        }

        return result;
    }


    private Object getObjectByDataLoadInfo(MbzLoadDataInfo dataInfo) {
        Long sourceType = dataInfo.getSourceType();
        String yjlxh = dataInfo.getSourceId() + "";
        if (sourceType == 1) {
            //1. 24h内入出院记录  --陈世杰
            HlhtRyjlRcyjl obj = new HlhtRyjlRcyjl();
            obj.setYjlxh(yjlxh);
            obj = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjl(obj);
            return obj;
        } else if (sourceType == 2) {
            //2. 24h内入院死亡记录*  -- 陈世杰
            HlhtRyjlRyswjl obj = new HlhtRyjlRyswjl();
            obj.setYjlxh(yjlxh);
            obj = super.getFacade().getHlhtRyjlRyswjlService().getHlhtRyjlRyswjl(obj);
            return obj;
        } else if (sourceType == 3) {
            //3. 病危（重）通知书*  --陈枫
            HlhtZqgzxxBwztzs obj = new HlhtZqgzxxBwztzs();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZqgzxxBwztzsService().getHlhtZqgzxxBwztzs(obj);
            return obj;
        } else if (sourceType == 4) {
            //4.出院记录数据集表* --陈枫
            HlhtZybcjlCyjl obj = new HlhtZybcjlCyjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlCyjlService().getHlhtZybcjlCyjl(obj);
            return obj;
        } else if (sourceType == 5) {
            //5.入院记录* --陈枫
            HlhtRyjlJbxx obj = new HlhtRyjlJbxx();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxx(obj);
            return obj;
        } else if (sourceType == 6) {
            //6.首次病程记录表* --陈蒯
            HlhtZybcjlScbcjl obj = new HlhtZybcjlScbcjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlScbcjlService().getHlhtZybcjlScbcjl(obj);
            return obj;
        } else if (sourceType == 7) {
            //7.日常病程记录数据集表*  --陈枫
            HlhtZybcjlRcbcjl obj = new HlhtZybcjlRcbcjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlRcbcjlService().getHlhtZybcjlRcbcjl(obj);
            return obj;
        } else if (sourceType == 8) {
            //8.交接班记录数据集表(医院一般不在病历里面写交接班记录，CIS有一个交接班的功能)*    --陈蒯（暂时不处理）
            HlhtZybcjlJjbjl obj = new HlhtZybcjlJjbjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlJjbjlService().getHlhtZybcjlJjbjl(obj);
            return obj;
        } else if (sourceType == 9) {
            //9.--阶段小结数据集表*   --陈蒯
            HlhtZybcjlJdxj obj = new HlhtZybcjlJdxj();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlJdxjService().getHlhtZybcjlJdxj(obj);
            return obj;
        } else if (sourceType == 10) {
            //10.抢救记录数据集表*  --陈蒯
            HlhtZybcjlQjjl obj = new HlhtZybcjlQjjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlQjjlService().getHlhtZybcjlQjjl(obj);
            return obj;
        } else if (sourceType == 11) {
            //11.术后首次病程记录数据集表* --- 陈世杰
            HlhtZybcjlShscbcjl obj = new HlhtZybcjlShscbcjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlShscbcjlService().getHlhtZybcjlShscbcjl(obj);
            return obj;
        } else if (sourceType == 12) {
            //12.术前小结数据集表* --- 陈世杰
            HlhtZybcjlSqxj obj = new HlhtZybcjlSqxj();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlSqxjService().getHlhtZybcjlSqxj(obj);
            return obj;
        } else if (sourceType == 13) {
            //13.术前讨论数据集表*   --陈世杰
            HlhtZybcjlSqtl obj = new HlhtZybcjlSqtl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlSqtlService().getHlhtZybcjlSqtl(obj);
            return obj;
        } else if (sourceType == 14) {
            //14.死亡病历讨论记录数据集表* --陈世杰
            HlhtZybcjlSwbltljl obj = new HlhtZybcjlSwbltljl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlSwbltljlService().getHlhtZybcjlSwbltljl(obj);
            return obj;
        } else if (sourceType == 15) {
            //15.死亡记录数据集表* --陈枫
            HlhtZybcjlSwjl obj = new HlhtZybcjlSwjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlSwjlService().getHlhtZybcjlSwjl(obj);
            return obj;
        } else if (sourceType == 16) {
            //16.麻醉术前访视记录表(由手麻系统处理）* --陈枫（暂时不处理）
            HlhtZlczjlMzsqfsjl obj = new HlhtZlczjlMzsqfsjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZlczjlMzsqfsjlService().getHlhtZlczjlMzsqfsjl(obj);
            return obj;
        } else if (sourceType == 17) {
            //17.麻醉术后访视记录表(由手麻系统处理)*   --陈枫（暂时不处理）
            HlhtZlczjlMzshfsjl obj = new HlhtZlczjlMzshfsjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZlczjlMzshfsjlService().getHlhtZlczjlMzshfsjl(obj);
            return obj;
        } else if (sourceType == 18) {
            //18.麻醉知情同意书表* --陈枫
            HlhtZqgzxxMzzqtys obj = new HlhtZqgzxxMzzqtys();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZqgzxxMzzqtysService().getHlhtZqgzxxMzzqtys(obj);
            return obj;
        } else if (sourceType == 19) {
            //19.其他知情告知同意书*  --陈蒯
            HlhtZqgzxxQtzqtys obj = new HlhtZqgzxxQtzqtys();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZqgzxxQtzqtysService().getHlhtZqgzxxQtzqtys(obj);
            return obj;
        } else if (sourceType == 20) {
            //20.一般手术记录表(待定）*    --陈蒯
            HlhtZlczjlYbssjl obj = new HlhtZlczjlYbssjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZlczjlYbssjlService().getHlhtZlczjlYbssjl(obj);
            return obj;
        } else if (sourceType == 21) {
            //21.会诊记录数据集表* --陈蒯
            HlhtZybcjlHzjl obj = new HlhtZybcjlHzjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlHzjlService().getHlhtZybcjlHzjl(obj);
            return obj;
        } else if (sourceType == 22) {
            //22.出院小结数据集表*  --陈蒯
            HlhtCyxjCyxj obj = new HlhtCyxjCyxj();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtCyxjCyxjService().getHlhtCyxjCyxj(obj);
            return obj;
        } else if (sourceType == 23) {
            //23.上级医师查房记录数据集表*  --陈世杰
            HlhtZybcjlSjyscfjl obj = new HlhtZybcjlSjyscfjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlSjyscfjlService().getHlhtZybcjlSjyscfjl(obj);
            return obj;
        } else if (sourceType == 24) {
            //24.手术知情同意书表*--陈世杰
            HlhtZqgzxxSstys obj = new HlhtZqgzxxSstys();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZqgzxxSstysService().getHlhtZqgzxxSstys(obj);
            return obj;
        } else if (sourceType == 25) {
            //25.输血治疗同意书表* -- 陈枫
            HlhtZqgzxxSxzltys obj = new HlhtZqgzxxSxzltys();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZqgzxxSxzltysService().getHlhtZqgzxxSxzltys(obj);
            return obj;
        } else if (sourceType == 26) {
            //26.疑难病例讨论数据集表* --陈枫
            HlhtZybcjlYnbltljl obj = new HlhtZybcjlYnbltljl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlYnbltljlService().getHlhtZybcjlYnbltljl(obj);
            return obj;
        } else if (sourceType == 27) {
            //27.转科记录数据集表*  --陈蒯
            HlhtZybcjlZkjl obj = new HlhtZybcjlZkjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZybcjlZkjlService().getHlhtZybcjlZkjl(obj);
            return obj;
        } else if (sourceType == 28) {
            //28.转诊(院)记录数据集表* --陈蒯  (暂时不处理)
            HlhtZzyjlZzyjl obj = new HlhtZzyjlZzyjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZzyjlZzyjlService().getHlhtZzyjlZzyjl(obj);
            return obj;
        } else if (sourceType == 29) {
            //29.特殊检查及特殊治疗同意书* --陈世杰
            HlhtZqgzxxTsjczltys obj = new HlhtZqgzxxTsjczltys();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZqgzxxTsjczltysService().getHlhtZqgzxxTsjczltys(obj);
            return obj;
        } else if (sourceType == 30) {
            //30.输血记录表* --陈枫
            HlhtZlczjlSxjl obj = new HlhtZlczjlSxjl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZlczjlSxjlService().getHlhtZlczjlSxjl(obj);
            return obj;
        } else if (sourceType == 31) {
            //31.门急诊病历记录表* --陈蒯
            HlhtMjzblMjzbl obj = new HlhtMjzblMjzbl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtMjzblMjzblService().getHlhtMjzblMjzbl(obj);
            return obj;
        } else if (sourceType == 32) {
            //32.急诊留观病历记录表*   --陈世杰
            HlhtMjzblJzlgbl obj = new HlhtMjzblJzlgbl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtMjzblJzlgblService().getHlhtMjzblJzlgbl(obj);
            return obj;
        } else if (sourceType == 33) {
            //33.治疗记录表* --陈枫
            HlhtZlczjlZljl obj = new HlhtZlczjlZljl();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZlczjlZljlService().getHlhtZlczjlZljl(obj);
            return obj;
        } else if (sourceType == 34) {
            //34.阴道分娩记录表*  --陈枫（暂时不处理）
            HlhtZcjlYdfm obj = new HlhtZcjlYdfm();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtZcjlYdfmService().getHlhtZcjlYdfm(obj);
            return obj;
        } else if (sourceType == 35) {
            //35.剖宫产记录表* --陈蒯
            HlhtZcjlPgc obj = new HlhtZcjlPgc();
            obj.setYjlxh(yjlxh);
            obj = super.getFacade().getHlhtZcjlPgcService().getHlhtZcjlPgc(obj);
            return obj;
        } else if (sourceType == 36) {
            //36.基本健康信息表* --陈世杰
            HlhtBlgyJbjkxx obj = new HlhtBlgyJbjkxx();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtBlgyJbjkxxService().getHlhtBlgyJbjkxx(obj);
            return obj;
        } else if (sourceType == 37) {
            //37.卫生事件摘要表* --陈蒯
            HlhtBlgyWssjzy obj = new HlhtBlgyWssjzy();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtBlgyWssjzyService().getHlhtBlgyWssjzy(obj);
            return obj;
        } else if (sourceType == 38) {
            //38.西药处方记录表* --陈世杰
            HlhtMjzcfXycf obj = new HlhtMjzcfXycf();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtMjzcfXycfService().getHlhtMjzcfXycf(obj);
            return obj;
        } else if (sourceType == 39) {
            //39.中药处方记录表* --陈枫
            HlhtMjzcfZycf obj = new HlhtMjzcfZycf();
            obj.setYjlxh(yjlxh);
            obj = getFacade().getHlhtMjzcfZycfService().getHlhtMjzcfZycf(obj);
            return obj;
        }
        return  null;

    }
}
