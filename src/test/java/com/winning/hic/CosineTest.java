package com.winning.hic;

import com.winning.hic.base.utils.CosineUtil;
import com.winning.hic.base.utils.StringUtil;

import java.util.List;

public class CosineTest {

    public void testCosine(){
        String nameValue = "";
        List<String> participleList = CosineUtil.stringParticiple(nameValue);
        String participleListStr = StringUtil.join(participleList,"||");
    }
    public void testCosine2(){
       /* List<String> str1List = StringUtil.split(mappingParticipleStr,"||");
        List<String> str2List = participleListMap.get(baseDataId);
        if(str2List==null){
            String baseParticipleStr = (String) baseMap.get(CommonStructure.NSTM_VC_PARTICIPLE.value);
            if(baseParticipleStr==null){
                baseParticipleStr = baseNameValue;
            }
            str2List = StringUtils.split(baseParticipleStr,"||");
            participleListMap.put(baseDataId,str2List);
        }

        int [][] res = CosineUtil.getStringFrequency(str1List,str2List);
        float cosValue = CosineUtil.getDoubleStrForCosValue(res);
        if(cosValue>maxCosValue){
            maxBaseMap = baseMap;
            maxCosValue=cosValue;
        }*/
    }
}
