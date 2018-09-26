package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtMjzcfZycf;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
* @author HLHT
* @title HLHT_MJZCF_ZYCF
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-30-31 16:30:02
*/
public interface HlhtMjzcfZycfService {

    public int createHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf);

    public int modifyHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf);

    public int removeHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf);

    public HlhtMjzcfZycf getHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf);

    public int getHlhtMjzcfZycfCount(HlhtMjzcfZycf hlhtMjzcfZycf);

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfList(HlhtMjzcfZycf hlhtMjzcfZycf);

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfPageList(HlhtMjzcfZycf hlhtMjzcfZycf);

    public List<HlhtMjzcfZycf> getHlhtMjzcfZycfListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtMjzcfZycfByYjlxh(HlhtMjzcfZycf hlhtMjzcfZycf);

    List<MbzDataCheck> interfaceHlhtMjzcfZycf(MbzDataCheck entity) throws Exception;
}