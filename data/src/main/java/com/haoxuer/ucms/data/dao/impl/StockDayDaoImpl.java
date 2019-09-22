package com.haoxuer.ucms.data.dao.impl;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.ucms.data.dao.StockDayDao;
import com.haoxuer.ucms.data.entity.StockDay;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.discover.data.core.Finder;
import com.haoxuer.discover.data.core.Pagination;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StockDayDaoImpl extends CriteriaDaoImpl<StockDay, Long> implements StockDayDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public StockDay findById(Long id) {
		StockDay entity = get(id);
		return entity;
	}

	@Override
	public StockDay findByDay(Long stock, String day) {
		List<Filter> filters = new ArrayList<>();
		filters.add(Filter.eq("stock.id", stock));
		filters.add(Filter.eq("day", day));

		List<StockDay> dayTimes = list(0, 2, filters, null);
		if (dayTimes != null && dayTimes.size() > 0) {
			return dayTimes.get(0);
		}
		return null;
	}

	public StockDay save(StockDay bean) {
		getSession().save(bean);
		return bean;
	}

	public StockDay deleteById(Long id) {
		StockDay entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<StockDay> getEntityClass() {
		return StockDay.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}

	public StockDay findByCode(String code,String date) {
		Finder finder=Finder.create();
		finder.append("from StockDay d where d.code =:code");
		finder.setParam("code", code);
		finder.append("  and d.date =:date");
		finder.setParam("date", date);
		StockDay  stock=findOne(finder);
		return stock;
	}
}