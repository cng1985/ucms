package com.quhaodian.ucms.rest.api;

import com.quhaodian.ucms.rest.domain.page.StockPage;
import com.quhaodian.ucms.rest.domain.request.PageRequest;

public interface StockApi {

  StockPage page(PageRequest request);
}
