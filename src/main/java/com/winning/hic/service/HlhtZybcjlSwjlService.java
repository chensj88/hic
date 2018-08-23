package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.*;
import org.dom4j.Document;
import org.springframework.dao.DataAccessException;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SWJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:47
*/
public interface HlhtZybcjlSwjlService {

    public int createHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public int modifyHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public int removeHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public HlhtZybcjlSwjl getHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public int getHlhtZybcjlSwjlCount(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlList(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlPageList(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZybcjlSwjlByYjlxh(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public List<MbzDataCheck> interfaceHlhtZybcjlSwjl(MbzDataCheck entity) ;
}