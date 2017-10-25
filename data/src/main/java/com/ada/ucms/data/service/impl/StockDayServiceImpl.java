package com.ada.ucms.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ada.data.core.Finder;
import com.ada.data.core.Pagination;
import com.ada.data.core.Updater;
import com.ada.ucms.data.dao.StockDayDao;
import com.ada.ucms.data.entity.StockDay;
import com.ada.ucms.data.service.StockDayService;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import java.util.List;


@Service
@Transactional
public class StockDayServiceImpl implements StockDayService {
	

	@Transactional(readOnly = true)
	public StockDay findById(Long id) {
		StockDay entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public StockDay save(StockDay bean) {
		dao.save(bean);
		return bean;
	}

    @Transactional
	public StockDay update(StockDay bean) {
		Updater<StockDay> updater = new Updater<StockDay>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public StockDay deleteById(Long id) {
		StockDay bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public StockDay[] deleteByIds(Long[] ids) {
		StockDay[] beans = new StockDay[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockDayDao dao;

	@Autowired
	public void setDao(StockDayDao dao) {
		this.dao = dao;
	}
	

	
	@Transactional(readOnly = true)
	public Page<StockDay> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	@Transactional(readOnly = true)
	public List<StockDay> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}