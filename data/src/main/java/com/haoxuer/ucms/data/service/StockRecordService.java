package com.haoxuer.ucms.data.service;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.ucms.data.entity.StockRecord;

import java.util.List;

public interface StockRecordService {

	public StockRecord findById(Long id);

	public StockRecord save(StockRecord bean);

	public StockRecord update(StockRecord bean);

	public StockRecord deleteById(Long id);
	
	public StockRecord[] deleteByIds(Long[] ids);
	

	public Page<StockRecord> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockRecord> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}