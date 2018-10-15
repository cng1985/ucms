package com.quhaodian.ucms.data.service;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.quhaodian.ucms.data.entity.Stock;

import java.util.List;

public interface StockService {

  Stock findById(Long id);

  Stock findByCode(String code);

  int updates();

  void sync();

  Stock save(Stock bean);

  Stock update(Stock bean);

  Stock deleteById(Long id);

  Stock[] deleteByIds(Long[] ids);


  Page<Stock> findPage(Pageable pageable);

  long count(Filter... filters);

  List<Stock> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);

  Stock time(Long id);
  
  void compute();
  
}