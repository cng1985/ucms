package com.quhaodian.ucms.data.dao;


import  com.quhaodian.data.core.CriteriaDao;
import  com.quhaodian.data.core.Updater;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.ucms.data.entity.StockNote;
import com.quhaodian.ucms.data.entity.StockNote;

public interface StockNoteDao extends CriteriaDao<StockNote, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockNote findById(Long id);

	public StockNote save(StockNote bean);

	public StockNote updateByUpdater(Updater<StockNote> updater);

	public StockNote deleteById(Long id);
}