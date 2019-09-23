package com.haoxuer.ucms.questions.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.questions.data.dao.QuestionVoteDao;
import com.haoxuer.ucms.questions.data.entity.QuestionVote;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
@Repository

public class QuestionVoteDaoImpl extends CriteriaDaoImpl<QuestionVote, Long> implements QuestionVoteDao {

	@Override
	public QuestionVote findById(Long id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public QuestionVote save(QuestionVote bean) {

        getSession().save(bean);
		
		
		return bean;
	}

    @Override
	public QuestionVote deleteById(Long id) {
		QuestionVote entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<QuestionVote> getEntityClass() {
		return QuestionVote.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}