package com.winning.hic.controller;

import com.winning.hic.HicApplication;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * Description: 页面跳转
 * User: LENOVO
 * Date: 2018-07-17
 * Time: 15:25
 */
@Controller
public class PageController {

    @ApiOperation(value = "首页信息",notes = "")
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String login(){
        if(HicApplication.config){
            return "index";
        }else{
            return "config";
        }

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


    @ApiOperation(value = "测试模板页面",notes = "")
    @RequestMapping(value = "/template",method = RequestMethod.GET)
    public String testTemplate(){
        return "test/template";
    }
}
