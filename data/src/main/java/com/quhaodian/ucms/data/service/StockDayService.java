package com.quhaodian.ucms.data.service;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.entity.StockDay;
import com.quhaodian.ucms.data.entity.StockDay;

import java.util.List;


public interface StockDayService {

	public StockDay findById(Long id);

	public StockDay save(StockDay bean);

	public StockDay update(StockDay bean);

	public StockDay deleteById(Long id);
	
	public StockDay[] deleteByIds(Long[] ids);
	

	
	public Page<StockDay> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockDay> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}