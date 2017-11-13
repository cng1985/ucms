package com.quhaodian.ucms.data.dao;


import  com.quhaodian.data.core.CriteriaDao;
import  com.quhaodian.data.core.Updater;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.ucms.data.entity.StockCatalog;
import com.quhaodian.ucms.data.entity.StockCatalog;

public interface StockCatalogDao extends CriteriaDao<StockCatalog, Integer>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockCatalog findById(Integer id);
	
	public StockCatalog findBName(String name);


	public StockCatalog save(StockCatalog bean);

	public StockCatalog updateByUpdater(Updater<StockCatalog> updater);

	public StockCatalog deleteById(Integer id);
}