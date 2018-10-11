package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.DomUtils;
import com.winning.hic.model.EmrMbk;
import com.winning.hic.model.MbzDataListSet;
import com.winning.hic.model.MbzDictInfo;
import com.winning.hic.model.MbzTemplateNodeDetailInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/detail")
public class DetailController extends BaseController {
    /**
     * 解析已配置模板节点信息
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    @RequestMapping(value = "/convert")
    public Map<String, Object> convertToTemplateDetail() throws InvocationTargetException, IllegalAccessException {
        MbzDictInfo dictInfo = new MbzDictInfo();
        dictInfo.setDictCode("platformTableName");
        List<MbzDictInfo> dictInfoList = getFacade().getMbzDictInfoService().getMbzDictInfoList(dictInfo);
        for (MbzDictInfo info : dictInfoList) {
            MbzDataListSet listSet = new MbzDataListSet();
            listSet.setSourceType(info.getDictValue());
            List<MbzDataListSet> dataListSets = super.getFacade().getMbzDataListSetService().getMbzDataListSetList(listSet);
            for (MbzDataListSet set : dataListSets) {
                EmrMbk mbk = new EmrMbk();
                mbk.setMbdm(set.getModelCode());
                mbk = getFacade().getEmrMbkService().getEmrMbk(mbk);
                if(mbk == null){
                    continue;
                }else{
                    List<MbzTemplateNodeDetailInfo> templateNodeDetailInfos = DomUtils.convertXMLToObject(info.getDictValue(), mbk.getMbmc(),mbk.getMbnr(),mbk.getMbdm());
                    getFacade().getMbzTemplateNodeDetailInfoService().createMbzTemplateNodeDetailInfoList(templateNodeDetailInfos);
                }
            }
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("msg", "测试转换模板信息");
        return result;
    }

    /**
     * 解析特定已配置模板节点信息
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    @RequestMapping(value = "/convertTemplate")
    public Map<String, Object> convertToTemplateDetail(String sourceType) throws InvocationTargetException, IllegalAccessException {

        MbzDataListSet listSet = new MbzDataListSet();
        listSet.setSourceType(sourceType);
        List<MbzDataListSet> dataListSets = super.getFacade().getMbzDataListSetService().getMbzDataListSetList(listSet);
        for (MbzDataListSet set : dataListSets) {
            EmrMbk mbk = new EmrMbk();
            mbk.setMbdm(set.getModelCode());
            mbk = getFacade().getEmrMbkService().getEmrMbk(mbk);
            if(mbk == null){
                continue;
            }else{
                List<MbzTemplateNodeDetailInfo> templateNodeDetailInfos = DomUtils.convertXMLToObject(sourceType, mbk.getMbmc(),mbk.getMbnr(),mbk.getMbdm());
                getFacade().getMbzTemplateNodeDetailInfoService().createMbzTemplateNodeDetailInfoList(templateNodeDetailInfos);
            }
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("msg", "测试转换模板信息");
        return result;
    }
}
