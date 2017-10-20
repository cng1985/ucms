package com.ada.ucms.data.page;

import com.ada.data.core.Pagination;
import com.ada.data.dto.PageRpc;
import com.ada.ucms.data.entity.StockRecord;
public class StockRecordPage extends PageRpc<StockRecord> {

	public StockRecordPage(Pagination<StockRecord> page) {
		super(page);
	}

}
