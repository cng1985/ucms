package com.quhaodian.ucms.data.service;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
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