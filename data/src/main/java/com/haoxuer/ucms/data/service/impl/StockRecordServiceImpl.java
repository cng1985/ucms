package com.haoxuer.ucms.data.service.impl;

import com.haoxuer.ucms.data.dao.StockRecordDao;
import com.haoxuer.ucms.data.entity.StockRecord;
import com.haoxuer.ucms.data.service.StockRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;


@Service
@Transactional
public class StockRecordServiceImpl implements StockRecordService {
	

	@Transactional(readOnly = true)
	public StockRecord findById(Long id) {
		StockRecord entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public StockRecord save(StockRecord bean) {
		dao.save(bean);
		return bean;
	}

    @Transactional
	public StockRecord update(StockRecord bean) {
		Updater<StockRecord> updater = new Updater<StockRecord>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public StockRecord deleteById(Long id) {
		StockRecord bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public StockRecord[] deleteByIds(Long[] ids) {
		StockRecord[] beans = new StockRecord[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockRecordDao dao;

	@Autowired
	public void setDao(StockRecordDao dao) {
		this.dao = dao;
	}
	

	@Transactional(readOnly = true)
	public Page<StockRecord> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	@Transactional(readOnly = true)
	public List<StockRecord> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}