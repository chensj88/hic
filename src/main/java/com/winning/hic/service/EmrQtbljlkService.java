package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-30 13:02:59
 */
public interface EmrQtbljlkService {

	Integer createEmrQtbljlk(EmrQtbljlk t);

	int modifyEmrQtbljlk(EmrQtbljlk t);

	int removeEmrQtbljlk(EmrQtbljlk t);

	EmrQtbljlk getEmrQtbljlk(EmrQtbljlk t);

	List<EmrQtbljlk> getEmrQtbljlkList(EmrQtbljlk t);

	Integer getEmrQtbljlkCount(EmrQtbljlk t);

	List<EmrQtbljlk> getEmrQtbljlkPaginatedList(EmrQtbljlk t);

}