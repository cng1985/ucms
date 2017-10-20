package com.ada.ucms.data.dao;


import  com.ada.data.core.CriteriaDao;
import  com.ada.data.core.Updater;
import com.ada.data.core.Pagination;
import  com.ada.ucms.data.entity.Stock;

public interface StockDao extends CriteriaDao<Stock, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public Stock findById(Long id);
	
	public Stock findByName(String name);

	public Stock findByCode(String code);

	public Stock save(Stock bean);

	public Stock updateByUpdater(Updater<Stock> updater);

	public Stock deleteById(Long id);
}