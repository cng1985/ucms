package com.ada.ucms.data.service;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.ucms.data.entity.StockLike;
import com.ada.ucms.data.page.StockLikePage;

import java.util.List;

public interface StockLikeService {

	public StockLike findById(Long id);

	public StockLike save(StockLike bean);

	public StockLike update(StockLike bean);

	public StockLike deleteById(Long id);
	
	public StockLike[] deleteByIds(Long[] ids);
	
	public StockLikePage getPage(int pageNo, int pageSize);
	
	
	public Page<StockLike> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockLike> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}