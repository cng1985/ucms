package com.quhaodian.ucms.data.dao;


import  com.haoxuer.discover.data.core.CriteriaDao;
import  com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.core.Pagination;
import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.ucms.data.entity.StockDetail;

public interface StockDetailDao extends CriteriaDao<StockDetail, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockDetail findById(Long id);

	public StockDetail save(StockDetail bean);

	public StockDetail updateByUpdater(Updater<StockDetail> updater);

	public StockDetail deleteById(Long id);
}