package com.quhaodian.ucms.data.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.discover.data.core.Finder;
import com.haoxuer.discover.data.core.Pagination;
import com.quhaodian.ucms.data.dao.StockCatalogDao;
import com.quhaodian.ucms.data.entity.StockCatalog;

@Repository
public class StockCatalogDaoImpl extends CriteriaDaoImpl<StockCatalog, Integer> implements StockCatalogDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public StockCatalog findById(Integer id) {
		StockCatalog entity = get(id);
		return entity;
	}

	public StockCatalog save(StockCatalog bean) {
		getSession().save(bean);
		return bean;
	}

	public StockCatalog deleteById(Integer id) {
		StockCatalog entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<StockCatalog> getEntityClass() {
		return StockCatalog.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}

	public StockCatalog findBName(String name) {
		Finder finder=Finder.create();
		finder.append("from StockCatalog s where s.name =:name");
		finder.setParam("name", name);
		return findOne(finder);
	}
}