package com.haoxuer.ucms.data.dao.impl;

import com.haoxuer.ucms.data.dao.StockDao;
import com.haoxuer.ucms.data.entity.Stock;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.discover.data.core.Finder;
import com.haoxuer.discover.data.core.Pagination;

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

	public Stock findByName(String name) {
		
		Finder finder=Finder.create();
		finder.append("from Stock s where s.name =:name");
		finder.setParam("name", name);
		return findOne(finder);
	}

	public Stock findByCode(String name) {
		Finder finder=Finder.create();
		finder.append("from Stock  s where s.code =:code");
		finder.setParam("code", name);
		return findOne(finder);
	}
}