package com.ada.iwan.data.service;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.iwan.data.entity.StockRecord;
import com.ada.iwan.data.page.StockRecordPage;

import java.util.List;

public interface StockRecordService {

	public StockRecord findById(Long id);

	public StockRecord save(StockRecord bean);

	public StockRecord update(StockRecord bean);

	public StockRecord deleteById(Long id);
	
	public StockRecord[] deleteByIds(Long[] ids);
	
	public StockRecordPage getPage(int pageNo, int pageSize);
	
	
	public Page<StockRecord> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockRecord> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}