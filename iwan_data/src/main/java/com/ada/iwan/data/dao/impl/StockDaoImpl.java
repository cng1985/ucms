package com.ada.iwan.data.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ada.data.core.CriteriaDaoImpl;
import com.ada.data.core.Pagination;
import com.ada.iwan.data.dao.StockDao;
import com.ada.iwan.data.entity.Stock;

@Repository
public class StockDaoImpl extends CriteriaDaoImpl<Stock, Long> implements StockDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public Stock findById(Long id) {
		Stock entity = get(id);
		return entity;
	}

	public Stock save(Stock bean) {
		getSession().save(bean);
		return bean;
	}

	public Stock deleteById(Long id) {
		Stock entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<Stock> getEntityClass() {
		return Stock.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}