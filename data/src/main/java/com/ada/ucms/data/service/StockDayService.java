package com.ada.ucms.data.service;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.ucms.data.entity.StockDay;
import com.ada.ucms.data.page.StockDayPage;

import java.util.List;


public interface StockDayService {

	public StockDay findById(Long id);

	public StockDay save(StockDay bean);

	public StockDay update(StockDay bean);

	public StockDay deleteById(Long id);
	
	public StockDay[] deleteByIds(Long[] ids);
	
	public StockDayPage getPage(int pageNo, int pageSize);
	
	
	public Page<StockDay> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockDay> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}