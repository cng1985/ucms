package com.haoxuer.ucms.questions.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.questions.data.dao.QuestionWordDao;
import com.haoxuer.ucms.questions.data.entity.QuestionWord;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
@Repository

public class QuestionWordDaoImpl extends CriteriaDaoImpl<QuestionWord, Long> implements QuestionWordDao {

	@Override
	public QuestionWord findById(Long id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public QuestionWord save(QuestionWord bean) {

        getSession().save(bean);
		
		
		return bean;
	}

    @Override
	public QuestionWord deleteById(Long id) {
		QuestionWord entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<QuestionWord> getEntityClass() {
		return QuestionWord.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}