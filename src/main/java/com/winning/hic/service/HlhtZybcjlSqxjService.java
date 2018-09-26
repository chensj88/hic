package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtZybcjlSqxj;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SQXJ
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:33
*/
public interface HlhtZybcjlSqxjService {

    public int createHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    public int modifyHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    public int removeHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    public HlhtZybcjlSqxj getHlhtZybcjlSqxj(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    public int getHlhtZybcjlSqxjCount(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    public List<HlhtZybcjlSqxj> getHlhtZybcjlSqxjList(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    public List<HlhtZybcjlSqxj> getHlhtZybcjlSqxjPageList(HlhtZybcjlSqxj hlhtZybcjlSqxj);

    /**
     * 提取住院病程记录中术前小结数据
     * @param entity
     * @return
     */
    public List<MbzDataCheck> interfaceHlhtZybcjlSqxj(MbzDataCheck entity) throws Exception;
}