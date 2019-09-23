package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.Question;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionDao extends BaseDao<Question,Long>{

	 Question findById(Long id);

	 Question save(Question bean);

	 Question updateByUpdater(Updater<Question> updater);

	 Question deleteById(Long id);
}