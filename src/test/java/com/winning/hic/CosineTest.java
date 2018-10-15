package com.winning.hic;

import com.winning.hic.base.utils.CosineUtil;
import com.winning.hic.base.utils.StringUtil;
import org.junit.Test;

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


    //@Test
    public void test(){
        String a = "病史陈述者";
        String b = "陈述者";
        List<String> str1List = CosineUtil.stringParticiple(a);
        List<String> str2List = CosineUtil.stringParticiple(b);
        int [][] res = CosineUtil.getStringFrequency(str1List,str2List);
        System.out.println(CosineUtil.getDoubleStrForCosValue(res));
    }


    //@Test
    public void test2(){
        String aa = "病史陈述者姓名";
        String bb = "陈述者姓名";
        List<String> str1List = CosineUtil.stringParticiple(aa);
        List<String> str2List = CosineUtil.stringParticiple(bb);
        float maxCosValue = 0.0f;
        String code = "";
        for (int i = 0; i <str1List.size() ; i++) {
            int [][] res = CosineUtil.getStringFrequency(str1List,str2List);
            float cosValue = CosineUtil.getDoubleStrForCosValue(res);
            if(cosValue > maxCosValue){
                maxCosValue = cosValue;
                code = str2List.get(i);
            }
        }
        System.out.println(maxCosValue);
        System.out.println(code);
    }
}
