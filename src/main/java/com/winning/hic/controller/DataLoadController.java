package com.winning.hic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DataLoadController extends BaseController{

    @RequestMapping("/dataLoad/index")
    public String index() {

        return "/dataLoad/index";
    }



}
