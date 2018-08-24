package com.winning.hic.controller;

import com.winning.hic.model.MbzModelCheck;
import com.winning.hic.service.MbzModelCheckService;
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
    private MbzModelCheckService mbzModelCheckService;

    @RequestMapping("/modelCheck/index")
    public String index() {
        return "modelCheck/modelCheck";
    }

    @RequestMapping("/modelCheck/list")
    @ResponseBody
    public List<MbzModelCheck> list(MbzModelCheck mbzModelCheck) {
        //获取数据集目录
        List<MbzModelCheck> mbzModelCheckList = mbzModelCheckService.selectDataSet();
        return mbzModelCheckList;
    }


}
