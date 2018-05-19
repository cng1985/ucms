package com.quhaodian.ucms.data.dao;

import com.quhaodian.data.core.CriteriaDao;
import com.quhaodian.data.core.Updater;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.ucms.data.entity.StockDay;
import com.quhaodian.ucms.data.entity.StockDay;

public interface StockDayDao extends CriteriaDao<StockDay, Long> {
	public Pagination getPage(int pageNo, int pageSize);

	public StockDay findById(Long id);

	public StockDay findByDay(Long stock,String day);


	public StockDay findByCode(String code,String date);

	public StockDay save(StockDay bean);

	public StockDay updateByUpdater(Updater<StockDay> updater);

	public StockDay deleteById(Long id);
}