package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.MbzDataTemplateConfig;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title 【模板字段配置】DAO接口
* @email Winning Health
* @package com.winning.hic.dao.data
* @date 2018-24-26 09:24:06
*/
@Repository
public interface MbzDataTemplateConfigDao {

    public int insertMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;

    public int updateMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;

    public int deleteMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;

    public MbzDataTemplateConfig selectMbzDataTemplateConfig(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;

    public Object selectMbzDataTemplateConfigCount(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;

    public List<MbzDataTemplateConfig> selectMbzDataTemplateConfigList(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;

    public List<MbzDataTemplateConfig> selectMbzDataTemplateConfigPageList(MbzDataTemplateConfig mbzDataTemplateConfig) throws DataAccessException;
}