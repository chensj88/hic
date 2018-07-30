package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataTemplateConfig;


/**
* @author MBZ
* @title 【模板字段配置】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-24-26 09:24:06
*/
public interface MbzDataTemplateConfigService {

    public int createMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig);

    public int modifyMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig);

    public int removeMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig);

    public MbzDataTemplateConfig getMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig);

    public int getMbzDataTemplateConfigCount(MbzDataTemplateConfig mbzDataTemplateConfig);

    public List<MbzDataTemplateConfig> getMbzDataTemplateConfigList(MbzDataTemplateConfig mbzDataTemplateConfig);

    public List<MbzDataTemplateConfig> getMbzDataTemplateConfigPageList(MbzDataTemplateConfig mbzDataTemplateConfig);
}