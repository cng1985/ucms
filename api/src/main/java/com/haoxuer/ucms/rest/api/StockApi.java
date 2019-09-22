package com.haoxuer.ucms.rest.api;

import com.haoxuer.ucms.rest.domain.page.StockPage;
import com.haoxuer.ucms.rest.domain.request.PageRequest;

public interface StockApi {

  StockPage page(PageRequest request);
}
