package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.DateUtil;
import com.winning.hic.model.MbzAutomateSet;
import com.winning.hic.model.MbzDictInfo;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description: 页面跳转
 * User: LENOVO
 * Date: 2018-07-17
 * Time: 15:25
 */
@Controller
public class PageController extends BaseController {

    @ApiOperation(value = "首页信息",notes = "")
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String login(){
        return "index";
    }

    @ApiOperation(value = "验证用户是否存在" ,notes="验证输入的用户ID是否存在")
    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "String")
    @RequestMapping(value = "/checkHaveUser",method = RequestMethod.POST)
    public String checkHaveUser(String userId){
        System.out.println(userId);
        return "success";
    }

    @ApiOperation(value = "登录信息验证" ,notes="验证输入的用户和密码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "String"),
            @ApiImplicitParam(name = "password", value = "用户密码", required = true, dataType = "String")
    })
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String checkLogin(String userId,String password){
        System.out.println(userId);
        System.out.println(password);
        return "success";
    }


    @ApiOperation(value = "测试模板页面",notes = "测试模板页面")
    @RequestMapping(value = "/template",method = RequestMethod.GET)
    public String testTemplate(){
        return "test/template";
    }

    @ApiOperation(value = "跳转数据初始化页面",notes = "跳转初始化页面")
    @GetMapping(value = "/init/initData")
    public String initDataPage(Model model){
        //获取数据子集
        MbzDictInfo temp2 = new MbzDictInfo();
        temp2.setDictCode("platformTableName");
        List<MbzDictInfo> dictList = super.getFacade().getMbzDictInfoService().getMbzDictInfoList(temp2);
        resultMap.put("dataSet", dictList);
        model.addAllAttributes(resultMap);
        return "init/index";
    }
    @ApiOperation(value = "页面跳转",notes = "跳转到配置页面")
    @GetMapping(value = "/config/index")
    public String goToConfigPage(Model model){
        MbzAutomateSet automateSet = getFacade().getMbzAutomateSetService().getMbzAutomateSet(null);

        if(automateSet == null){
            resultMap.put("batchDate", DateUtil.format(new Date(),DateUtil.TIME_8));
        }else{
            resultMap.put("batchDate", automateSet.getBatchDate());
        }
        model.addAllAttributes(resultMap);
        return "config/index";
    }
    @ApiOperation(value = "页面跳转",notes = "跳转到数据校验")
    @GetMapping(value = "/dataCheck/index")
    public String goToDataCheckPage(){
        return "dataCheck/index";
    }
    @ApiOperation(value = "页面跳转",notes = "跳转到日志查看")
    @GetMapping(value = "/logger/index")
    public String goToLoggerPage(){
        return "logger/index";
    }

    @ApiOperation(value = "页面跳转",notes = "跳转病历解析页面")
    @GetMapping(value = "/blnr")
    public String goToBLJXPage(){
        return "init/demo";
    }


}
