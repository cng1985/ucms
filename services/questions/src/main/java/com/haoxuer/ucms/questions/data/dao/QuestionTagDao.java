package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionTag;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionTagDao extends BaseDao<QuestionTag,Long>{

	 QuestionTag findById(Long id);

	 QuestionTag save(QuestionTag bean);

	 QuestionTag updateByUpdater(Updater<QuestionTag> updater);

	 QuestionTag deleteById(Long id);
}