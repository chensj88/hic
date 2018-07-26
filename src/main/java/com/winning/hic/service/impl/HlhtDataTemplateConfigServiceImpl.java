package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.HlhtDataTemplateConfig;  

import com.winning.hic.dao.data.HlhtDataTemplateConfigDao;  

import com.winning.hic.service.HlhtDataTemplateConfigService;  


/**
* @author HLHT
* @title 【模板字段配置】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-24-26 09:24:06
*/
@Service
public class HlhtDataTemplateConfigServiceImpl implements  HlhtDataTemplateConfigService {

    @Autowired
    private HlhtDataTemplateConfigDao hlhtDataTemplateConfigDao;

    public int createHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return this.hlhtDataTemplateConfigDao.insertHlhtDataTemplateConfig(hlhtDataTemplateConfig);
    }

    public int modifyHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return this.hlhtDataTemplateConfigDao.updateHlhtDataTemplateConfig(hlhtDataTemplateConfig);
    }

    public int removeHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return this.hlhtDataTemplateConfigDao.deleteHlhtDataTemplateConfig(hlhtDataTemplateConfig);
    }

    public HlhtDataTemplateConfig getHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return this.hlhtDataTemplateConfigDao.selectHlhtDataTemplateConfig(hlhtDataTemplateConfig);
    }

    public int getHlhtDataTemplateConfigCount(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return (Integer)this.hlhtDataTemplateConfigDao.selectHlhtDataTemplateConfigCount(hlhtDataTemplateConfig);
    }

    public List<HlhtDataTemplateConfig> getHlhtDataTemplateConfigList(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return this.hlhtDataTemplateConfigDao.selectHlhtDataTemplateConfigList(hlhtDataTemplateConfig);
    }

    public List<HlhtDataTemplateConfig> getHlhtDataTemplateConfigPageList(HlhtDataTemplateConfig hlhtDataTemplateConfig){
        return this.hlhtDataTemplateConfigDao.selectHlhtDataTemplateConfigPageList(hlhtDataTemplateConfig);
    }
}