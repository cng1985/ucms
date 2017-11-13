package com.quhaodian.ucms.data.service;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.entity.StockCatalog;
import com.quhaodian.ucms.data.entity.StockCatalog;

import java.util.List;

public interface StockCatalogService {

	public StockCatalog findById(Integer id);

	public StockCatalog save(StockCatalog bean);

	public StockCatalog update(StockCatalog bean);

	public StockCatalog deleteById(Integer id);
	
	public StockCatalog[] deleteByIds(Integer[] ids);
	

	public Page<StockCatalog> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockCatalog> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}