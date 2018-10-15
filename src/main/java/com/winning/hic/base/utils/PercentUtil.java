package com.winning.hic.base.utils;

import com.winning.hic.model.MbzDataColumn;
import com.winning.hic.service.MbzDataColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

@Component
public class PercentUtil {
    @Autowired
    private MbzDataColumnService mbzDataColumnService;

    private static PercentUtil percentUtil;

    @PostConstruct
    public void init() {
        percentUtil = this;
        percentUtil.mbzDataColumnService = this.mbzDataColumnService;
    }

    /**
     * 获取字段补全百分比
     *
     * @param sourceType
     * @param type       计算类型1：有值必填字段占所有必填字段百分比；0：有值必填字段占所有字段百分比
     * @return
     */
    public static int getPercent(Long sourceType, Object obj, int type) throws Exception {
        MbzDataColumn mbzDataColumn = new MbzDataColumn();
        mbzDataColumn.setSourceType(sourceType);
        //必填字段有值总数
        int isBtNum = 0;
        //有值总数
        int notNullNum = 0;
        //必填字段总数数
        int btNum = 0;
        //获取表字段集合
        List<MbzDataColumn> mbzDataColumnList = percentUtil.mbzDataColumnService.getMbzDataColumnList(mbzDataColumn);
        //所有字段数
        int allNum = mbzDataColumnList.size();
        for (MbzDataColumn temp : mbzDataColumnList) {
            Integer bt = temp.getBt();
            //判断是否为必填
            if (bt.intValue() == 1) {
                btNum++;
            }
            String methodName = "get" + StringUtil.titleCase(temp.getPyCode());
            Object value = ReflectUtil.getParam(obj, methodName);
            if (value == null) {
                continue;
            }
            if ((value instanceof String) && !"NA".equals(value)) {
                notNullNum++;
                if (bt.intValue() == 1) {
                    isBtNum++;
                }

            }
            if (value instanceof Date) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(((Date) value).getTime());
                int year = calendar.get(Calendar.YEAR);
                if (year != 1990) {
                    notNullNum++;
                    if (bt.intValue() == 1) {
                        isBtNum++;
                    }
                }
            }
            if (value instanceof Timestamp) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(((Timestamp) value).getTime());
                int year = calendar.get(Calendar.YEAR);
                if (year != 1990) {
                    notNullNum++;
                    if (bt.intValue() == 1) {
                        isBtNum++;
                    }
                }
            }
        }
//        System.out.println("isBtNum:"+isBtNum);
//        System.out.println("btNum:"+btNum);
//        System.out.println("notNullNum:"+notNullNum);
//        System.out.println("allNum:"+allNum);
        int percentNum = 0;
        if (type == 1) {
            percentNum = isBtNum * 100 / btNum;
        } else if (type == 0) {
            percentNum = notNullNum * 100 / allNum;
        }

        return percentNum;
    }

}
