package com.ada.ucms.data.page;

import com.ada.data.core.Pagination;
import com.ada.data.dto.PageRpc;
import com.ada.ucms.data.entity.StockDetail;
public class StockDetailPage extends PageRpc<StockDetail> {

	public StockDetailPage(Pagination<StockDetail> page) {
		super(page);
	}

}
