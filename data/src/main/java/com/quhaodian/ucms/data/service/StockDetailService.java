package com.quhaodian.ucms.data.service;

import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import java.util.List;


public interface StockDetailService {

	public StockDetail findById(Long id);

	public StockDetail findByCode(String code);

	public StockDetail save(StockDetail bean);

	public StockDetail update(StockDetail bean);

	public StockDetail deleteById(Long id);

	public StockDetail[] deleteByIds(Long[] ids);


	public Page<StockDetail> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<StockDetail> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);

}