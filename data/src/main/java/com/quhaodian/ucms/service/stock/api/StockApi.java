package com.quhaodian.ucms.service.stock.api;
import com.quhaodian.ucms.service.stock.domain.StockDetailBack;
import com.quhaodian.ucms.service.stock.domain.StockListBack;
import com.quhaodian.ucms.service.stock.domain.StockDetailBack;
import com.quhaodian.ucms.service.stock.domain.StockListBack;

/**
 * 查询股票列表
 * @author dell1
 *
 */
public interface StockApi {
	
	
	
	StockListBack findStcokList(int page, int rows);
	
	StockDetailBack findByCode(String code);
}
