package com.quhaodian.ucms.rest.resources;

import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.dao.StockDao;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.rest.api.StockApi;
import com.quhaodian.ucms.rest.conver.PageableConver;
import com.quhaodian.ucms.rest.conver.StockSimpleConver;
import com.quhaodian.ucms.rest.domain.page.StockPage;
import com.quhaodian.ucms.rest.domain.request.PageRequest;
import com.quhaodian.user.utils.ConverResourceUtils;
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
