package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionPoints;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionPointsDao extends BaseDao<QuestionPoints,Long>{

	 QuestionPoints findById(Long id);

	 QuestionPoints save(QuestionPoints bean);

	 QuestionPoints updateByUpdater(Updater<QuestionPoints> updater);

	 QuestionPoints deleteById(Long id);
}