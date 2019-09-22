package com.haoxuer.ucms.data.service;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.ucms.data.entity.StockCatalog;

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