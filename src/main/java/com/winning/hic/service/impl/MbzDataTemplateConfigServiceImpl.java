package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDataTemplateConfig;

import com.winning.hic.dao.data.MbzDataTemplateConfigDao;

import com.winning.hic.service.MbzDataTemplateConfigService;


/**
* @author MBZ
* @title 【模板字段配置】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-24-26 09:24:06
*/
@Service
public class MbzDataTemplateConfigServiceImpl implements  MbzDataTemplateConfigService {

    @Autowired
    private MbzDataTemplateConfigDao mbzDataTemplateConfigDao;

    public int createMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig){
        return this.mbzDataTemplateConfigDao.insertMbzDataTemplateConfig(mbzDataTemplateConfig);
    }

    public int modifyMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig){
        return this.mbzDataTemplateConfigDao.updateMbzDataTemplateConfig(mbzDataTemplateConfig);
    }

    public int removeMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig){
        return this.mbzDataTemplateConfigDao.deleteMbzDataTemplateConfig(mbzDataTemplateConfig);
    }

    public MbzDataTemplateConfig getMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig){
        return this.mbzDataTemplateConfigDao.selectMbzDataTemplateConfig(mbzDataTemplateConfig);
    }

    public int getMbzDataTemplateConfigCount(MbzDataTemplateConfig mbzDataTemplateConfig){
        return (Integer)this.mbzDataTemplateConfigDao.selectMbzDataTemplateConfigCount(mbzDataTemplateConfig);
    }

    public List<MbzDataTemplateConfig> getMbzDataTemplateConfigList(MbzDataTemplateConfig mbzDataTemplateConfig){
        return this.mbzDataTemplateConfigDao.selectMbzDataTemplateConfigList(mbzDataTemplateConfig);
    }

    public List<MbzDataTemplateConfig> getMbzDataTemplateConfigPageList(MbzDataTemplateConfig mbzDataTemplateConfig){
        return this.mbzDataTemplateConfigDao.selectMbzDataTemplateConfigPageList(mbzDataTemplateConfig);
    }
}