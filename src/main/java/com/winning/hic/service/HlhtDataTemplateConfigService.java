package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtDataTemplateConfig;  


/**
* @author HLHT
* @title 【模板字段配置】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-24-26 09:24:06
*/
public interface HlhtDataTemplateConfigService {

    public int createHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig);

    public int modifyHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig);

    public int removeHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig);

    public HlhtDataTemplateConfig getHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig);

    public int getHlhtDataTemplateConfigCount(HlhtDataTemplateConfig hlhtDataTemplateConfig);

    public List<HlhtDataTemplateConfig> getHlhtDataTemplateConfigList(HlhtDataTemplateConfig hlhtDataTemplateConfig);

    public List<HlhtDataTemplateConfig> getHlhtDataTemplateConfigPageList(HlhtDataTemplateConfig hlhtDataTemplateConfig);
}