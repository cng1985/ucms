package com.ada.ucms.data.service;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.ucms.data.entity.StockCatalog;

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