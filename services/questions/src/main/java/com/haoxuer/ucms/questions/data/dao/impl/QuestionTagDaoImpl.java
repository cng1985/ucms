package com.haoxuer.ucms.questions.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.questions.data.dao.QuestionTagDao;
import com.haoxuer.ucms.questions.data.entity.QuestionTag;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
@Repository

public class QuestionTagDaoImpl extends CriteriaDaoImpl<QuestionTag, Long> implements QuestionTagDao {

	@Override
	public QuestionTag findById(Long id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public QuestionTag save(QuestionTag bean) {

        getSession().save(bean);
		
		
		return bean;
	}

    @Override
	public QuestionTag deleteById(Long id) {
		QuestionTag entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<QuestionTag> getEntityClass() {
		return QuestionTag.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}