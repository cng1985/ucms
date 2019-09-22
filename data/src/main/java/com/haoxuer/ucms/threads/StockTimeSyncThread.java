package com.haoxuer.ucms.threads;

import com.haoxuer.ucms.data.service.StockService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StockTimeSyncThread implements Runnable {
  
  private StockService stockService;
  
  private Logger logger= LoggerFactory.getLogger("ada");
  
  public StockTimeSyncThread(StockService stockService, Long id) {
    this.stockService = stockService;
    this.id = id;
  }
  
  private Long id;
  
  @Override
  public void run() {
    try {
      stockService.time(id);
      logger.info("syns is end");
    }catch (Exception e){
      logger.error("erro",e);
    }
  }
}
