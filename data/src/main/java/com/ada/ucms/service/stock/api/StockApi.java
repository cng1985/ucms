package com.ada.ucms.service.stock.api;
import com.ada.ucms.service.stock.domain.StockDetailBack;
import com.ada.ucms.service.stock.domain.StockListBack;
/**
 * 查询股票列表
 * @author dell1
 *
 */
public interface StockApi {
	
	
	
	StockListBack findStcokList(int page,int rows);
	
	StockDetailBack findByCode(String code);
}