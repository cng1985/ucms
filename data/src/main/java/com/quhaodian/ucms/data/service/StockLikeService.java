package com.quhaodian.ucms.data.service;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.quhaodian.ucms.data.entity.StockLike;

import java.util.List;

public interface StockLikeService {

	public StockLike findById(Long id);

	public StockLike save(StockLike bean);

	public StockLike update(StockLike bean);

	public StockLike deleteById(Long id);
	
	public StockLike[] deleteByIds(Long[] ids);
	

	public Page<StockLike> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockLike> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}