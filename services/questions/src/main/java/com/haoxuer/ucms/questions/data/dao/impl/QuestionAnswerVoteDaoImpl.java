package com.haoxuer.ucms.questions.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.questions.data.dao.QuestionAnswerVoteDao;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswerVote;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
@Repository

public class QuestionAnswerVoteDaoImpl extends CriteriaDaoImpl<QuestionAnswerVote, Long> implements QuestionAnswerVoteDao {

	@Override
	public QuestionAnswerVote findById(Long id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public QuestionAnswerVote save(QuestionAnswerVote bean) {

        getSession().save(bean);
		
		
		return bean;
	}

    @Override
	public QuestionAnswerVote deleteById(Long id) {
		QuestionAnswerVote entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<QuestionAnswerVote> getEntityClass() {
		return QuestionAnswerVote.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}