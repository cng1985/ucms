package com.quhaodian.ucms.data.service.impl;

import com.quhaodian.ucms.data.service.StockLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Finder;
import com.haoxuer.discover.data.core.Pagination;
import com.haoxuer.discover.data.core.Updater;
import com.quhaodian.ucms.data.dao.StockLikeDao;
import com.quhaodian.ucms.data.entity.StockLike;
import com.quhaodian.ucms.data.service.StockLikeService;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;


@Service
@Transactional
public class StockLikeServiceImpl implements StockLikeService {
	

	@Transactional(readOnly = true)
	public StockLike findById(Long id) {
		StockLike entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public StockLike save(StockLike bean) {
		dao.save(bean);
		return bean;
	}

    @Transactional
	public StockLike update(StockLike bean) {
		Updater<StockLike> updater = new Updater<StockLike>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public StockLike deleteById(Long id) {
		StockLike bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public StockLike[] deleteByIds(Long[] ids) {
		StockLike[] beans = new StockLike[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockLikeDao dao;

	@Autowired
	public void setDao(StockLikeDao dao) {
		this.dao = dao;
	}
	

	@Transactional(readOnly = true)
	public Page<StockLike> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	@Transactional(readOnly = true)
	public List<StockLike> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}