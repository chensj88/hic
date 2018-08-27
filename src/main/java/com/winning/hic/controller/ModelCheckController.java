package com.winning.hic.controller;

import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.model.EmrMbk;
import com.winning.hic.model.MbzDataListSet;
import com.winning.hic.model.MbzDictInfo;
import com.winning.hic.model.MbzModelCheck;
import com.winning.hic.service.MbzModelCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
    public String index(Model model) {
        //清库
        //getFacade().getMbzModelCheckService().removeMbzModelCheck(new MbzModelCheck());
        //数据初始化
        getFacade().getMbzModelCheckService().innitModelCheckData();
        //获取去模板总数
        Integer emrMbkCount = getFacade().getEmrMbkService().getEmrMbkCount(new EmrMbk());
        //从字典表获取数据集
        MbzDictInfo mbzDictInfo = new MbzDictInfo();
        mbzDictInfo.setDictCode("platformTableName");
        List<MbzDictInfo> mbzDictInfoList = getFacade().getMbzDictInfoService().getMbzDictInfoList(mbzDictInfo);
        List<MbzDataListSet> modelList = getFacade().getMbzDataListSetService().getMbzDataListSetList(new MbzDataListSet());
        resultMap.put("num", emrMbkCount);
        resultMap.put("dataSet", mbzDictInfoList);
        resultMap.put("modelList", modelList);
        model.addAllAttributes(resultMap);
        return "/modelCheck/modelCheck";
    }

    /**
     * 数据集
     * @param mbzModelCheck
     * @return
     */
    @RequestMapping("/modelCheck/list")
    @ResponseBody
    public List<MbzModelCheck> list(MbzModelCheck mbzModelCheck) {
        //获取数据集目录
        List<MbzModelCheck> mbzModelCheckList = mbzModelCheckService.selectDataSet(mbzModelCheck);
        return mbzModelCheckList;
    }

    @RequestMapping("/modelCheck/modelList")
    @ResponseBody
    public List<MbzModelCheck> modelList(MbzModelCheck mbzModelCheck) {
        if (StringUtil.isEmptyOrNull(mbzModelCheck.getSourceType())) {
            return null;
        }
        //获取数据集目录
        List<MbzModelCheck> mbzModelCheckList = mbzModelCheckService.selectModelListBySourceType(mbzModelCheck);
        return mbzModelCheckList;
    }

    @RequestMapping("/modelCheck/modelCheckList")
    @ResponseBody
    public List<MbzModelCheck> modelCheckList(MbzModelCheck mbzModelCheck) {
        if (StringUtil.isEmptyOrNull(mbzModelCheck.getSourceType())) {
            return null;
        }
        //获取数据集目录
        List<MbzModelCheck> mbzModelCheckList = mbzModelCheckService.getMbzModelCheckList(mbzModelCheck);
        return mbzModelCheckList;
    }


}
