package com.haoxuer.ucms.data.dao;


import  com.haoxuer.discover.data.core.CriteriaDao;
import  com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.core.Pagination;
import com.haoxuer.ucms.data.entity.StockLike;

public interface StockLikeDao extends CriteriaDao<StockLike, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockLike findById(Long id);

	public StockLike save(StockLike bean);

	public StockLike updateByUpdater(Updater<StockLike> updater);

	public StockLike deleteById(Long id);
}