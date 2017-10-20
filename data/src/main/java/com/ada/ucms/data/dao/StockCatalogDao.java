package com.ada.ucms.data.dao;


import  com.ada.data.core.CriteriaDao;
import  com.ada.data.core.Updater;
import com.ada.data.core.Pagination;
import  com.ada.ucms.data.entity.StockCatalog;

public interface StockCatalogDao extends CriteriaDao<StockCatalog, Integer>{
	public Pagination getPage(int pageNo, int pageSize);

	public StockCatalog findById(Integer id);
	
	public StockCatalog findBName(String name);


	public StockCatalog save(StockCatalog bean);

	public StockCatalog updateByUpdater(Updater<StockCatalog> updater);

	public StockCatalog deleteById(Integer id);
}