package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtRyjlJbxx;
import com.winning.hic.model.MbzDataListSet;
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
        getFacade().getHlhtRyjlJbxxService().interfaceHlhtRyjlJbxx();
//        getFacade().getHlhtZqgzxxBwztzsService().interfaceHlhtZqgzxxBwztzs();
        return resultMap;
    }

}
