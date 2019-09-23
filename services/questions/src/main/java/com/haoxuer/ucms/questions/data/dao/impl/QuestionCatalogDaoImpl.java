package com.haoxuer.ucms.questions.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.questions.data.dao.QuestionCatalogDao;
import com.haoxuer.ucms.questions.data.entity.QuestionCatalog;
import com.haoxuer.discover.data.core.CatalogDaoImpl;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
@Repository

public class QuestionCatalogDaoImpl extends CatalogDaoImpl<QuestionCatalog, Integer> implements QuestionCatalogDao {

	@Override
	public QuestionCatalog findById(Integer id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public QuestionCatalog save(QuestionCatalog bean) {

		add(bean);
		
		
		return bean;
	}

    @Override
	public QuestionCatalog deleteById(Integer id) {
		QuestionCatalog entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<QuestionCatalog> getEntityClass() {
		return QuestionCatalog.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}