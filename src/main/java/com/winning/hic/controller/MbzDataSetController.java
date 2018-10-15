package com.winning.hic.controller;

import com.alibaba.fastjson.JSON;
import com.winning.hic.base.Constants;
import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.MbzLog;
import com.winning.hic.model.MbzTemplateNodeDetailInfo;
import com.winning.hic.model.support.Row;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:基础模板配置
 * User: LENOVO
 * Date: 2018-07-26
 * Time: 9:20
 */
@RestController
public class MbzDataSetController extends BaseController {

    @ApiOperation(value = "/basic/list",notes = "加载接口表字段信息")
    @ApiImplicitParams(
        {
                @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet"),
                @ApiImplicitParam(name = "config",value = "是否已经配置路径",required = false,dataType = "Integer"),
        }
    )
    @GetMapping("/basic/list")
    public Map<String, Object> loadBasicTemplateInfo(MbzDataSet dataSet, Integer config){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetList(dataSet));
        return result;
    }
    @ApiOperation(value = "/basic/edit",notes = "编辑接口表信息")
    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
    @RequestMapping(value = "/basic/edit",method = RequestMethod.POST)
    public Map<String, Object> editMbzDataSetInfo(MbzDataSet dataSet,Integer status){
        Map<String, Object> result = new HashMap<String, Object>();
        if (status == null ){
            if("null".equals(dataSet.getDtjddm())){
                dataSet.setDtjddm(null);
            }
            if("null".equals(dataSet.getQrmbdm())){
                dataSet.setQrdxdm(null);
            }
            if("null".equals(dataSet.getQrdxdm())){
                dataSet.setQrdxdm(null);
            }
            if("null".equals(dataSet.getYzjddm())){
                dataSet.setYzjddm(null);
            }
            MbzDataSet oldDataSet = new MbzDataSet();
            oldDataSet.setPyCode(dataSet.getPyCode());
            oldDataSet.setPId(dataSet.getPId());
            oldDataSet.setSourceType(dataSet.getSourceType());
            oldDataSet.setDtjddm(dataSet.getDtjddm());
            oldDataSet.setQrmbdm(dataSet.getQrmbdm());
            oldDataSet.setQrdxdm(dataSet.getQrdxdm());
            oldDataSet.setYzjddm(dataSet.getYzjddm());
            int count = super.getFacade().getMbzDataSetService().getMbzDataSetCount(oldDataSet);
            //convertToNull(dataSet);
            if(count > 1){
                result.put("status", Constants.ERROR);
                result.put("msg", "当前字段配置数据已经存在，请修改!");
                return result;
            }else {
                MbzLog log = new MbzLog();
                oldDataSet = new MbzDataSet();
                oldDataSet.setId(dataSet.getId());
                oldDataSet = getFacade().getMbzDataSetService().getMbzDataSet(oldDataSet);
                log.setContent("元数据类型:"+oldDataSet.getSourceType()+" 字段："+oldDataSet.getPyCode()+" 修改前："+JSON.toJSONString(oldDataSet));
                log.setOperatorTime(new Timestamp(new Date().getTime()));
                getFacade().getMbzLogService().createMbzLog(log);
                getFacade().getMbzDataSetService().modifyMbzDataSet(dataSet);
                log.setContent("元数据类型:"+dataSet.getSourceType()+" 字段："+dataSet.getPyCode()+" 修改后："+JSON.toJSONString(dataSet));
                log.setOperatorTime(new Timestamp(new Date().getTime()));
                getFacade().getMbzLogService().createMbzLog(log);
            }
        }else{
            dataSet.setId(null);
            if("null".equals(dataSet.getDtjddm())){
                dataSet.setDtjddm(null);
            }
            if("null".equals(dataSet.getQrmbdm())){
                dataSet.setQrdxdm(null);
            }
            if("null".equals(dataSet.getQrdxdm())){
                dataSet.setQrdxdm(null);
            }
            if("null".equals(dataSet.getYzjddm())){
                dataSet.setYzjddm(null);
            }
            MbzDataSet oldDataSet = new MbzDataSet();
            oldDataSet.setPId(dataSet.getPId());
            oldDataSet.setPyCode(dataSet.getPyCode());
            oldDataSet.setSourceType(dataSet.getSourceType());
            oldDataSet.setDtjddm(dataSet.getDtjddm());
            oldDataSet.setQrmbdm(dataSet.getQrmbdm());
            oldDataSet.setQrdxdm(dataSet.getQrdxdm());
            oldDataSet.setYzjddm(dataSet.getYzjddm());
            int count = super.getFacade().getMbzDataSetService().getMbzDataSetCount(oldDataSet);
            //convertToNull(dataSet);
            if(count >= 1){
                result.put("status", Constants.ERROR);
                result.put("msg", "当前字段配置数据已经存在，请修改!");
                return result;
            }else{
                getFacade().getMbzDataSetService().createMbzDataSet(dataSet);
                MbzLog log = new MbzLog();
                log.setContent("元数据类型:"+dataSet.getSourceType()+" 字段："+dataSet.getPyCode()+" 新增："+JSON.toJSONString(dataSet));
                log.setOperatorTime(new Timestamp(new Date().getTime()));
                getFacade().getMbzLogService().createMbzLog(log);
            }
        }
        result.put("status", Constants.SUCCESS);
        return result;
    }

    @ApiOperation(value = "/basic/plist",notes = "加载接口表父级字段信息")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "row",value = "分页参数",required = true,dataType = "Row"),
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet"),
                    @ApiImplicitParam(name = "config",value = "是否已经配置路径",required = false,dataType = "Integer"),
            }
    )
    @GetMapping("/basic/plist")
    public Map<String, Object> loadBasicTemplateInfoList(Row row, MbzDataSet dataSet, Integer config){
        //sourceType等于0 则查看全部
        if("0".equals(dataSet.getSourceType())){
            dataSet.setSourceType(null);
        }
        dataSet.setPId(0L);
        dataSet.setRow(row);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("total", getFacade().getMbzDataSetService().getMbzDataSetCount(dataSet));
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetPageList(dataSet));
        return result;
    }
    
    @ApiOperation(value = "/basic/clist",notes = "加载接口表子级字段信息")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet"),
                    @ApiImplicitParam(name = "config",value = "是否已经配置路径",required = false,dataType = "Integer"),
            }
    )
    @GetMapping("/basic/clist")
    public Map<String, Object> loadBasicTemplateInfoListChild(MbzDataSet dataSet, Integer config){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("total", getFacade().getMbzDataSetService().getMbzDataSetCount(dataSet));
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetList(dataSet));
        return result;
    }

    @ApiOperation(value = "/basic/tree",notes = "加载当前接口表字段信息，并生成树")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
            }
    )
    @PostMapping("/basic/tree")
    public Map<String, Object> loadColumnsForInterfaceTable(MbzDataSet dataSet){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", getFacade().getMbzDataSetService().getNodeTreeFromMbzDataSet(dataSet));
        return result;
    }

    @ApiOperation(value = "/basic/templateTree",notes = "加载当前接口表字段信息，并生成树")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
            }
    )
    @PostMapping("/basic/templateTree")
    public Map<String, Object> loadColumnsForTemplateTable(MbzTemplateNodeDetailInfo info){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", getFacade().getMbzTemplateNodeDetailInfoService().getNodeTreeFromMbzTemplateNodeDetailInfo(info));
        return result;
    }


    @ApiOperation(value = "/basic/delete",notes = "删除选中数据")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
            }
    )
    @PostMapping("/basic/delete")
    public Map<String, Object> removeMbzDataSetData(MbzDataSet dataSet){
        MbzDataSet old = super.getFacade().getMbzDataSetService().getMbzDataSet(dataSet);
        MbzLog log = new MbzLog();
        log.setContent("元数据类型:"+old.getSourceType()+" 字段："+old.getPyCode()+"删除："+JSON.toJSONString(old));
        log.setOperatorTime(new Timestamp(new Date().getTime()));
        getFacade().getMbzLogService().createMbzLog(log);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", getFacade().getMbzDataSetService().removeMbzDataSet(dataSet));
        return result;
    }


    private MbzDataSet convertToNull(MbzDataSet set){
        if(set.getDataType() == 1){
            set.setQrmbdm("");
            set.setQrdxdm("");
            set.setYzjddm("");
        }else if(set.getDataType() == 2){
            set.setQrdxdm("");
            set.setYzjddm("");
        }else if(set.getDataType() == 3){
            set.setYzjddm("");
        }
        return set;
    }
}
