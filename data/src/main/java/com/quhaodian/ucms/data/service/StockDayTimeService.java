package com.quhaodian.ucms.data.service;

import com.quhaodian.ucms.data.entity.StockDayTime;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2018年05月19日21:36:17.
*/
public interface StockDayTimeService {

	StockDayTime findById(Long id);

	StockDayTime save(StockDayTime bean);

	StockDayTime update(StockDayTime bean);

	StockDayTime deleteById(Long id);
	
	StockDayTime[] deleteByIds(Long[] ids);
	
	Page<StockDayTime> page(Pageable pageable);
	
	Page<StockDayTime> page(Pageable pageable, Object search);


	List<StockDayTime> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}