package com.winning.hic.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created with IntelliJ IDEA.
 * Description: 页面跳转
 * User: LENOVO
 * Date: 2018-07-17
 * Time: 15:25
 */
@Controller
public class PageController {

    @GetMapping(value = "/")
    public String login(){
        return "login/login";
    }
}
