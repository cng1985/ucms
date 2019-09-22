package com.haoxuer.ucms.data.dao;

import com.haoxuer.discover.data.core.CriteriaDao;
import com.haoxuer.discover.data.core.Pagination;
import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.data.entity.StockDay;

public interface StockDayDao extends CriteriaDao<StockDay, Long> {
  Pagination getPage(int pageNo, int pageSize);

  StockDay findById(Long id);

  StockDay findByDay(Long stock, String day);


  StockDay findByCode(String code, String date);

  StockDay save(StockDay bean);

  StockDay updateByUpdater(Updater<StockDay> updater);

  StockDay deleteById(Long id);
}