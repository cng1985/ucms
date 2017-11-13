package com.quhaodian.ucms.data.service;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.entity.StockNote;
import com.quhaodian.ucms.data.entity.StockNote;

import java.util.List;

public interface StockNoteService {

	public StockNote findById(Long id);

	public StockNote save(StockNote bean);

	public StockNote update(StockNote bean);

	public StockNote deleteById(Long id);
	
	public StockNote[] deleteByIds(Long[] ids);
	

	public Page<StockNote> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockNote> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}