package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionVote;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionVoteDao extends BaseDao<QuestionVote,Long>{

	 QuestionVote findById(Long id);

	 QuestionVote save(QuestionVote bean);

	 QuestionVote updateByUpdater(Updater<QuestionVote> updater);

	 QuestionVote deleteById(Long id);
}