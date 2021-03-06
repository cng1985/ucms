package com.haoxuer.ucms.data.service.impl;

import com.haoxuer.ucms.data.dao.StockCatalogDao;
import com.haoxuer.ucms.data.entity.StockCatalog;
import com.haoxuer.ucms.data.service.StockCatalogService;
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
public class StockCatalogServiceImpl implements StockCatalogService {
	

	@Transactional(readOnly = true)
	public StockCatalog findById(Integer id) {
		StockCatalog entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public StockCatalog save(StockCatalog bean) {
		dao.save(bean);
		
		if (bean.getParentId() != null) {
			StockCatalog parent = dao.findById(bean.getParentId());
			if (parent != null) {
				if (parent.getLevelInfo() != null) {
					bean.setLevelInfo(parent.getLevelInfo() + 1);
				} else {
					bean.setLevelInfo(2);
				}
				if (parent.getIds()!=null) {
					bean.setIds(parent.getIds()+","+bean.getId());

				}else{
					bean.setIds(parent.getId()+","+bean.getId());
				}
				
			} else {
				bean.setLevelInfo(1);
				bean.setIds(""+bean.getId());
			}
		} else {
			bean.setLevelInfo(1);
			bean.setIds(""+bean.getId());
		}
		return bean;
	}

    @Transactional
	public StockCatalog update(StockCatalog bean) {
		Updater<StockCatalog> updater = new Updater<StockCatalog>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public StockCatalog deleteById(Integer id) {
		StockCatalog bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public StockCatalog[] deleteByIds(Integer[] ids) {
		StockCatalog[] beans = new StockCatalog[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockCatalogDao dao;

	@Autowired
	public void setDao(StockCatalogDao dao) {
		this.dao = dao;
	}
	

	@Transactional(readOnly = true)
	public Page<StockCatalog> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	@Transactional(readOnly = true)
	public List<StockCatalog> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}