package com.quhaodian.ucms.data.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quhaodian.data.core.CriteriaDaoImpl;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.ucms.data.dao.StockLikeDao;
import com.quhaodian.ucms.data.entity.StockLike;

@Repository
public class StockLikeDaoImpl extends CriteriaDaoImpl<StockLike, Long> implements StockLikeDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public StockLike findById(Long id) {
		StockLike entity = get(id);
		return entity;
	}

	public StockLike save(StockLike bean) {
		getSession().save(bean);
		return bean;
	}

	public StockLike deleteById(Long id) {
		StockLike entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<StockLike> getEntityClass() {
		return StockLike.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}