package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtRyjlJbxx;
import com.winning.hic.model.MbzDataSet;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class RyjlJbxxExtractController extends BaseController {
    private final Logger logger = LoggerFactory.getLogger(RyjlJbxxExtractController.class);

    @RequestMapping("/ryjl/extract")
    @ResponseBody
    public Map extract(String mbdm) throws IOException {
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constant.WN_RYJL_JBXX_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constant.WN_RYJL_JBXX_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = getFacade().getMbzDataSetService().getMbzDataSetList(mbzDataSet);
        List<HlhtRyjlJbxx> hlhtRyjlJbxxListFromBaseData = getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxxListFromBaseData();
        for (HlhtRyjlJbxx hlhtRyjlJbxx : hlhtRyjlJbxxListFromBaseData) {
            EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
            emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtRyjlJbxx.getYjlxh()));
            emrQtbljlk = getFacade().getEmrQtbljlkService().getEmrQtbljlk(emrQtbljlk);
            //3.xml文件解析 获取病历信息
            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlJbxx.class);
            for (MbzDataSet dataSet : mbzDataSetList) {
                //获取属性名
                String pyCode = dataSet.getPyCode();
                String methodName = "set" + StringUtil.titleCase(pyCode);
                String strValue = XmlUtil.getAttrValueByDataSet(document, dataSet);
                logger.info("pyCode:{};methodName:{};strValue:{}", pyCode, methodName, strValue);
                Object value = null;
                String paramType = paramTypeMap.get(pyCode);
                if (paramType.contains("String")) {
                    value = StringUtil.isEmptyOrNull(strValue) ? "" : strValue.split("`")[2];
                } else if (paramType.contains("Short")) {
                    //格式：50`50`50
                    String shortStr = StringUtil.isEmptyOrNull(strValue) ? "0" : strValue.split("`")[2];
                    value = StringUtil.isEmptyOrNull(shortStr) ? null : Short.parseShort(shortStr);
                } else if (paramType.contains("Date")) {
//                格式：636467930400000000`2017-11-20,16:44
                    String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
                    String pattern = "yyyy-MM-dd,HH:mm";
                    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                    try {
                        Date date = StringUtil.isEmptyOrNull(dateStr) ? null : sdf.parse(dateStr);
                        if (date != null) {
                            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                            value = sqlDate;
                        } else {
                            java.sql.Date sqlDate = new java.sql.Date(sdf.parse("2017-11-20,16:44").getTime());
                            value = sqlDate;
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                } else if (paramType.contains("BigDecimal")) {
                    String dateStr = StringUtil.isEmptyOrNull(strValue) ? "0" : strValue.split("`")[1];
                    value = StringUtil.isEmptyOrNull(dateStr) ? null : new BigDecimal(dateStr);
                } else if (paramType.contains("Integer")) {
                    String dateStr = StringUtil.isEmptyOrNull(strValue) ? "0" : strValue.split("`")[1];
                    value = StringUtil.isEmptyOrNull(dateStr) ? null : Integer.parseInt(dateStr);
                }
                //类型
                try {
                    if (value != null) {
                        ReflectUtil.setParam(hlhtRyjlJbxx, methodName, value);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            logger.info("Model:{}", hlhtRyjlJbxx);
            //数据重复判断
            HlhtRyjlJbxx temp = new HlhtRyjlJbxx();
            temp.setYjlxh(hlhtRyjlJbxx.getYjlxh());
            temp = getFacade().getHlhtRyjlJbxxService().getHlhtRyjlJbxx(temp);
            if (temp == null) {
                getFacade().getHlhtRyjlJbxxService().createHlhtRyjlJbxx(hlhtRyjlJbxx);
            }
        }
        return resultMap;
    }


}
