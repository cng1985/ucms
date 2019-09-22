package com.haoxuer.ucms.service.stock.api;
import com.haoxuer.ucms.service.stock.domain.StockInfo;
import com.haoxuer.ucms.service.stock.domain.StockDetailBack;
import com.haoxuer.ucms.service.stock.domain.StockListBack;

import java.util.List;

/**
 * 查询股票列表
 * @author dell1
 *
 */
public interface StockApi {
	
	
	
	StockListBack findStcokList(int page, int rows);
	
	StockDetailBack findByCode(String code);

	List<StockInfo> stocks();
}
