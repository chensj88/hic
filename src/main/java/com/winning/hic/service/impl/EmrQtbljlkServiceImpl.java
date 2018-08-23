package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.service.EmrQtbljlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;




/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-30 13:02:59
 */
@Service
public class EmrQtbljlkServiceImpl implements EmrQtbljlkService {

	@Autowired
	private EmrQtbljlkDao emrQtbljlkDao;


	@Override
	public Integer createEmrQtbljlk(EmrQtbljlk t) {
		return emrQtbljlkDao.insertEmrQtbljlk(t);
	}

	@Override
	public int modifyEmrQtbljlk(EmrQtbljlk t) {
		return emrQtbljlkDao.updateEmrQtbljlk(t);
	}

	@Override
	public int removeEmrQtbljlk(EmrQtbljlk t) {
		return emrQtbljlkDao.deleteEmrQtbljlk(t);
	}

	@Override
	public EmrQtbljlk getEmrQtbljlk(EmrQtbljlk t) {
		return emrQtbljlkDao.selectEmrQtbljlk(t);
	}

	@Override
	public List<EmrQtbljlk> getEmrQtbljlkList(EmrQtbljlk t) {
		return emrQtbljlkDao.selectEmrQtbljlkList(t);
	}

	@Override
	public Integer getEmrQtbljlkCount(EmrQtbljlk t) {
		return (Integer) emrQtbljlkDao.selectEmrQtbljlkCount(t);
	}

	@Override
	public List<EmrQtbljlk> getEmrQtbljlkPaginatedList(EmrQtbljlk t) {
		return emrQtbljlkDao.selectEmrQtbljlkPaginatedList(t);
	}
}
