package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionWord;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionWordDao extends BaseDao<QuestionWord,Long>{

	 QuestionWord findById(Long id);

	 QuestionWord save(QuestionWord bean);

	 QuestionWord updateByUpdater(Updater<QuestionWord> updater);

	 QuestionWord deleteById(Long id);
}