package com.haoxuer.ucms.rest.resources;

import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.ucms.rest.domain.page.StockPage;
import com.haoxuer.ucms.rest.domain.request.PageRequest;
import com.haoxuer.ucms.data.dao.StockDao;
import com.haoxuer.ucms.data.entity.Stock;
import com.haoxuer.ucms.rest.api.StockApi;
import com.haoxuer.ucms.rest.conver.PageableConver;
import com.haoxuer.ucms.rest.conver.StockSimpleConver;
import com.haoxuer.discover.user.utils.ConverResourceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Component
public class StockResource implements StockApi {


  @Autowired
  private StockDao stockDao;

  @Override
  public StockPage page(PageRequest request) {
    StockPage result = new StockPage();
    Pageable pageable = new PageableConver().conver(request);
    Page<Stock> page = stockDao.page(pageable);
    ConverResourceUtils.coverPage(result, page, new StockSimpleConver());
    return result;
  }
}
