package com.quhaodian.ucms.data.dao;


import  com.haoxuer.discover.data.core.CriteriaDao;
import  com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.core.Pagination;
import com.quhaodian.ucms.data.entity.StockRecord;

public interface StockRecordDao extends CriteriaDao<StockRecord, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockRecord findById(Long id);

	public StockRecord save(StockRecord bean);

	public StockRecord updateByUpdater(Updater<StockRecord> updater);

	public StockRecord deleteById(Long id);
}