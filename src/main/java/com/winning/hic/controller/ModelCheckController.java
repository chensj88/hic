package com.winning.hic.controller;

import com.winning.hic.model.HlhtModelCheck;
import com.winning.hic.service.HlhtModelCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 模板校验Controller
 *
 * @author Evol
 * @date 2018年7月24日13:13:01
 */
@Controller
public class ModelCheckController extends BaseController {
    @Autowired
    private HlhtModelCheckService hlhtModelCheckService;

    @RequestMapping("/modelCheck/index")
    public String index() {
        return "/modelCheck/modelCheck";
    }

    @RequestMapping("/modelCheck/list")
    @ResponseBody
    public List<HlhtModelCheck> list(HlhtModelCheck hlhtModelCheck) {
        List<HlhtModelCheck> hlhtModelCheckList = hlhtModelCheckService.getHlhtModelCheckList(hlhtModelCheck);
        return hlhtModelCheckList;
    }


}
