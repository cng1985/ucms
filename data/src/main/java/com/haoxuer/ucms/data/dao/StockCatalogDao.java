package com.haoxuer.ucms.data.dao;


import  com.haoxuer.discover.data.core.CriteriaDao;
import  com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.core.Pagination;
import com.haoxuer.ucms.data.entity.StockCatalog;

public interface StockCatalogDao extends CriteriaDao<StockCatalog, Integer>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockCatalog findById(Integer id);
	
	public StockCatalog findBName(String name);


	public StockCatalog save(StockCatalog bean);

	public StockCatalog updateByUpdater(Updater<StockCatalog> updater);

	public StockCatalog deleteById(Integer id);
}