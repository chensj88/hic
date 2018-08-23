package com.winning.hic.controller;

import com.winning.hic.model.MbzDataSet;
import com.winning.hic.service.Facade;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-23
 * Time: 9:21
 */
public class BaseController {

    @Autowired
    private Facade facade;

    protected Map resultMap = new HashMap();

    public Facade getFacade() {
        return facade;
    }

    /**
     * 根据sourceType和字段名缩写查找字段配置
     *
     * @param sourceType
     * @param abbreviation
     * @return
     */
    public MbzDataSet getMbzDataSetBySourceTypeAndAbbreviation(String sourceType, String abbreviation) {
        MbzDataSet temp = new MbzDataSet();
        temp.setSourceType(sourceType);
        temp.setPyCode(abbreviation);
        return getFacade().getMbzDataSetService().getMbzDataSet(temp);
    }
}
