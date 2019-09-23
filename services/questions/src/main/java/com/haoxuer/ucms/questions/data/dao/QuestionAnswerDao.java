package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionAnswer;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionAnswerDao extends BaseDao<QuestionAnswer,Long>{

	 QuestionAnswer findById(Long id);

	 QuestionAnswer save(QuestionAnswer bean);

	 QuestionAnswer updateByUpdater(Updater<QuestionAnswer> updater);

	 QuestionAnswer deleteById(Long id);
}