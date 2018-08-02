package com.winning.hic.controller;

import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZybcjlScbcjl;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
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
            StringBuffer xml= new StringBuffer();
            xml.append(new String(qtbljlkList.get(0).getBlnr().getBytes("ASCII"),"UTF-8"));

            //xml文件解析
            Document doc =null;
            doc = DocumentHelper.parseText(xml.toString()); // 将字符串转为XML
            Element rootElt = doc.getRootElement();
            System.out.println("根节点：" + rootElt.getName()); // 拿到根节点的名称
            Iterator iter_ref = rootElt.elementIterator("Ref");
            Iterator iter_node = rootElt.elementIterator("node");
            List<Element> elements = XmlUtil.getNodes(rootElt);

            HlhtZybcjlScbcjl entity = new HlhtZybcjlScbcjl(); //首次病程记录表
            entity.setYjlxh("QTBLJLXH");
            entity.setJzlsh("SYXH");
            entity.setPatid("");
            entity.setBch("1111");

        }catch (Exception e){
            e.printStackTrace();
        }

        return "/dataLoad/index";
    }


}
