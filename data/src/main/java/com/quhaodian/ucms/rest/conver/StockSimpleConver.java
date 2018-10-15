package com.quhaodian.ucms.rest.conver;

import com.haoxuer.discover.data.rest.core.Conver;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.rest.domain.simple.StockSimple;

/**
 * TODO.
 *
 * @author ada.young
 * @version 1.01
 * @date 2018/5/20 11:28
 */
public class StockSimpleConver implements Conver<StockSimple,Stock> {
  @Override
  public StockSimple conver(Stock stock) {
    StockSimple result=new StockSimple();
    result.setCode(stock.getCode());
    result.setName(stock.getName());
    result.setPrice(stock.getPe());
    return result;
  }
}
