package com.winning.hic.controller;

import com.winning.hic.model.EmrQtbljlk;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Iterator;
import java.util.List;

@Controller
public class DataLoadController extends BaseController{

    @RequestMapping("/dataLoad/index")
    public String index() {
        //数据抽取
        try{
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            List<EmrQtbljlk> qtbljlkList = super.getFacade().getEmrQtbljlkService().getEmrQtbljlkList(qtbljlk);
            String xml = qtbljlkList.get(0).getBlnr();
            SAXReader reader = new SAXReader();
            Document document = reader.read(xml);
            // 通过document对象获取根节点node
            Element nodeStore = document.getRootElement();
            Iterator it =nodeStore.elementIterator();
            while(it.hasNext()){
                Element node = (Element) it.next();
                // 获取book的属性名以及 属性值
                List<Attribute> nodeAttrs = node.attributes();
                for(Attribute node_son:nodeAttrs){
                    System.out.println(node_son.getName()+"wei:"+node_son.getQName()+"值域："+node_son.getValue()+"为止:"+node_son.getNamespace());
                }

            }




        }catch (Exception e){
            e.printStackTrace();
        }

        return "/dataLoad/index";
    }


}
