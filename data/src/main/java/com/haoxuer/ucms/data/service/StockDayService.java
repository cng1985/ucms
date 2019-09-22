package com.haoxuer.ucms.data.service;

import com.haoxuer.ucms.data.entity.StockDay;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2018年12月05日17:51:09.
*/
public interface StockDayService {

	StockDay findById(Long id);

	StockDay save(StockDay bean);

	StockDay update(StockDay bean);

	StockDay deleteById(Long id);
	
	StockDay[] deleteByIds(Long[] ids);
	
	Page<StockDay> page(Pageable pageable);
	
	Page<StockDay> page(Pageable pageable, Object search);


	List<StockDay> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}