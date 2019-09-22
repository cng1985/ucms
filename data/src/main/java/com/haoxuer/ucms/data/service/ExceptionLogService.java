package com.haoxuer.ucms.data.service;

import com.haoxuer.ucms.data.entity.ExceptionLog;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2018年12月05日19:45:06.
*/
public interface ExceptionLogService {

	ExceptionLog findById(Long id);

	ExceptionLog save(ExceptionLog bean);

	ExceptionLog update(ExceptionLog bean);

	ExceptionLog deleteById(Long id);
	
	ExceptionLog[] deleteByIds(Long[] ids);
	
	Page<ExceptionLog> page(Pageable pageable);
	
	Page<ExceptionLog> page(Pageable pageable, Object search);


	List<ExceptionLog> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}