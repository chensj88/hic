package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtRyjlJbxx;
import com.winning.hic.model.HlhtZybcjlScbcjl;
import com.winning.hic.model.MbzDataSet;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
public class DataLoadController extends BaseController{
    private final Logger logger = LoggerFactory.getLogger(RyjlJbxxExtractController.class);

    @RequestMapping("/dataLoad/index")
    public String index() {
        //数据抽取
        try{

            MbzDataSet mbzDataSet = new MbzDataSet();
            mbzDataSet.setSourceType(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE);
            mbzDataSet.setPId(Long.parseLong(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE));
            List<MbzDataSet> mbzDataSetList = getFacade().getMbzDataSetService().getMbzDataSetList(mbzDataSet);
            //




            for(MbzDataSet dataSet : mbzDataSetList){

                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                //qtbljlk.setBldm(dataSet.getmo);
                List<EmrQtbljlk> qtbljlkList = super.getFacade().getEmrQtbljlkService().getEmrQtbljlkList(qtbljlk);
                for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                    //1.重复判断 数据的ID 是否存在
                    HlhtZybcjlScbcjl scbcjl = new HlhtZybcjlScbcjl();
                    scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    scbcjl = super.getFacade().getHlhtZybcjlScbcjlService().getHlhtZybcjlScbcjl(scbcjl);
                    if(scbcjl ==null){
                        //获取首次病程的对象集合
                        Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlScbcjl.class);

                        //2.获取病历的其他信息，获取HIS，CIS的信息
                        HlhtZybcjlScbcjl entity = new HlhtZybcjlScbcjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        super.getFacade().getHlhtZybcjlScbcjlService().createInitialHlhtZybcjlScbcjl(entity);
                        StringBuffer xml= new StringBuffer();
                        xml.append(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        //3.xml文件解析 获取病历信息
                        Document doc =XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));




                        String yjlxh = XmlUtil.getAttrValueByDataSet(doc, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE, "yjlxh"));// varchar(64) NOT NULL, --源记录序号
                        String jzlsh = XmlUtil.getAttrValueByDataSet(doc, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE, "jzlsh"));// varchar(64) NOT NULL, --源记录序号
                        logger.info("病史陈述者姓名:{}", yjlxh);

                    }

                }
            }





//            Element rootElt = doc.getRootElement();
//            System.out.println("根节点：" + rootElt.getName()); // 拿到根节点的名称
//            Iterator iter_ref = rootElt.elementIterator("Ref");
//            Iterator iter_node = rootElt.elementIterator("node");
//            List<Element> elements = XmlUtil.getNodes(rootElt);

//            String attrValue = XmlUtil.getAttrValueByDataSet(doc, mbzDataSet);

//            HlhtZybcjlScbcjl entity = new HlhtZybcjlScbcjl(); //首次病程记录表
//            entity.setYjlxh("QTBLJLXH");
//            entity.setJzlsh("SYXH");
//            entity.setPatid("");
//            entity.setBch("1111");

        }catch (Exception e){
            e.printStackTrace();
        }

        return "/dataLoad/index";
    }


}
