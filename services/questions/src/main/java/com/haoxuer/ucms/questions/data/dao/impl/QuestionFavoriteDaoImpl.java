package com.haoxuer.ucms.questions.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.questions.data.dao.QuestionFavoriteDao;
import com.haoxuer.ucms.questions.data.entity.QuestionFavorite;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
@Repository

public class QuestionFavoriteDaoImpl extends CriteriaDaoImpl<QuestionFavorite, Long> implements QuestionFavoriteDao {

	@Override
	public QuestionFavorite findById(Long id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public QuestionFavorite save(QuestionFavorite bean) {

        getSession().save(bean);
		
		
		return bean;
	}

    @Override
	public QuestionFavorite deleteById(Long id) {
		QuestionFavorite entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<QuestionFavorite> getEntityClass() {
		return QuestionFavorite.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}