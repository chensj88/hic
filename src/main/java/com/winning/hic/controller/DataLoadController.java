package com.winning.hic.controller;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class DataLoadController extends BaseController{

    @RequestMapping("/dataLoad/index")
    public String index() {
        //数据抽取
        EmrQtbljlk qtbljlk = new EmrQtbljlk();
        List<EmrQtbljlk> qtbljlkList = super.getFacade().getEmrQtbljlkService().getEmrQtbljlkList(qtbljlk);
        String xml = qtbljlkList.get(0).getBlnr();




        return "/dataLoad/index";
    }






}
