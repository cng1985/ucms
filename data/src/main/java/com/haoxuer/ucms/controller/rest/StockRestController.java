package com.haoxuer.ucms.controller.rest;

import com.haoxuer.ucms.rest.api.StockApi;
import com.haoxuer.ucms.rest.domain.page.StockPage;
import com.haoxuer.ucms.rest.domain.request.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * TODO.
 *
 * @author ada.young
 * @version 1.01
 * @date 2018/5/20 11:30
 */

@RequestMapping("/rest")
@RestController
public class StockRestController {

  @RequestMapping("/stock/page")
  public StockPage page(PageRequest request) {
    return api.page(request);
  }

  @Autowired
  private StockApi api;
}
