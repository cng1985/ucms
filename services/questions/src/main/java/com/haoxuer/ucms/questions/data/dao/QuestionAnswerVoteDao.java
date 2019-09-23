package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionAnswerVote;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionAnswerVoteDao extends BaseDao<QuestionAnswerVote,Long>{

	 QuestionAnswerVote findById(Long id);

	 QuestionAnswerVote save(QuestionAnswerVote bean);

	 QuestionAnswerVote updateByUpdater(Updater<QuestionAnswerVote> updater);

	 QuestionAnswerVote deleteById(Long id);
}