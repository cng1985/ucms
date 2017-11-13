package com.quhaodian.ucms.data.service;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.entity.StockRecord;
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