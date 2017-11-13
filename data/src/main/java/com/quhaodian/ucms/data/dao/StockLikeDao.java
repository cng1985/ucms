package com.quhaodian.ucms.data.dao;


import  com.quhaodian.data.core.CriteriaDao;
import  com.quhaodian.data.core.Updater;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.ucms.data.entity.StockLike;

public interface StockLikeDao extends CriteriaDao<StockLike, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockLike findById(Long id);

	public StockLike save(StockLike bean);

	public StockLike updateByUpdater(Updater<StockLike> updater);

	public StockLike deleteById(Long id);
}