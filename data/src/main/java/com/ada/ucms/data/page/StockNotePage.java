package com.ada.ucms.data.page;

import com.ada.data.core.Pagination;
import com.ada.data.dto.PageRpc;
import com.ada.ucms.data.entity.StockNote;
public class StockNotePage extends PageRpc<StockNote> {

	public StockNotePage(Pagination<StockNote> page) {
		super(page);
	}

}
