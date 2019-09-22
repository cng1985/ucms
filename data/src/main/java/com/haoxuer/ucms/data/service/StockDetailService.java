package com.haoxuer.ucms.data.service;

import com.haoxuer.ucms.data.entity.StockDetail;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
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