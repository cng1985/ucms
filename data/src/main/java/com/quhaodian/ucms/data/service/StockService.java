package com.quhaodian.ucms.data.service;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.entity.Stock;

import java.util.List;

public interface StockService {

	public Stock findById(Long id);

	public Stock findByCode(String code);

	public int updates();

	public Stock save(Stock bean);

	public Stock update(Stock bean);

	public Stock deleteById(Long id);

	public Stock[] deleteByIds(Long[] ids);


	public Page<Stock> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<Stock> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);

}