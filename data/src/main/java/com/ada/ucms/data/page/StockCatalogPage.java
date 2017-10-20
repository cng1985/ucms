package com.ada.ucms.data.page;

import com.ada.data.core.Pagination;
import com.ada.data.dto.PageRpc;
import com.ada.ucms.data.entity.StockCatalog;
public class StockCatalogPage extends PageRpc<StockCatalog> {

	public StockCatalogPage(Pagination<StockCatalog> page) {
		super(page);
	}

}
