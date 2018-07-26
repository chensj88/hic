package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtDataTemplateConfig;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title 【模板字段配置】DAO接口
* @email Winning Health
* @package com.winning.hic.dao.data
* @date 2018-24-26 09:24:06
*/
@Repository
public interface HlhtDataTemplateConfigDao {

    public int insertHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;

    public int updateHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;

    public int deleteHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;

    public HlhtDataTemplateConfig selectHlhtDataTemplateConfig(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;

    public Object selectHlhtDataTemplateConfigCount(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;

    public List<HlhtDataTemplateConfig> selectHlhtDataTemplateConfigList(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;

    public List<HlhtDataTemplateConfig> selectHlhtDataTemplateConfigPageList(HlhtDataTemplateConfig hlhtDataTemplateConfig) throws DataAccessException;
}