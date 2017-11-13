package com.quhaodian.ucms.data.service.impl;

import com.quhaodian.ucms.data.dao.StockNoteDao;
import com.quhaodian.ucms.data.entity.StockNote;
import com.quhaodian.ucms.data.service.StockNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quhaodian.data.core.Finder;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.data.core.Updater;
import com.quhaodian.ucms.data.dao.StockNoteDao;
import com.quhaodian.ucms.data.entity.StockNote;
import com.quhaodian.ucms.data.service.StockNoteService;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import java.util.List;


@Service
@Transactional
public class StockNoteServiceImpl implements StockNoteService {
	

	@Transactional(readOnly = true)
	public StockNote findById(Long id) {
		StockNote entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public StockNote save(StockNote bean) {
		dao.save(bean);
		return bean;
	}

    @Transactional
	public StockNote update(StockNote bean) {
		Updater<StockNote> updater = new Updater<StockNote>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public StockNote deleteById(Long id) {
		StockNote bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public StockNote[] deleteByIds(Long[] ids) {
		StockNote[] beans = new StockNote[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockNoteDao dao;

	@Autowired
	public void setDao(StockNoteDao dao) {
		this.dao = dao;
	}
	

	
	@Transactional(readOnly = true)
	public Page<StockNote> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	@Transactional(readOnly = true)
	public List<StockNote> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}