package com.quhaodian.ucms.service.stock.domain;

import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.entity.StockDayTime;

import java.io.Serializable;
import java.util.List;

public class StockInfo implements Serializable {
  
  /**
   * 股票代码
   */
  private String symbol;
  /**
   * 股票名称
   */
  private String name;
  
  private float yestClose;
  
  private int lastVolume;
  
  private String date;

  private List<StockTimePrice> prices;
  
  @Override
  public String toString() {
    return "StockInfo{" +
        "symbol='" + symbol + '\'' +
        ", name='" + name + '\'' +
        ", yestClose=" + yestClose +
        ", lastVolume=" + lastVolume +
        ", date='" + date + '\'' +
        '}';
  }
  
  public String getSymbol() {
    return symbol;
  }
  
  public void setSymbol(String symbol) {
    this.symbol = symbol;
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public float getYestClose() {
    return yestClose;
  }
  
  public void setYestClose(float yestClose) {
    this.yestClose = yestClose;
  }
  
  public int getLastVolume() {
    return lastVolume;
  }
  
  public void setLastVolume(int lastVolume) {
    this.lastVolume = lastVolume;
  }
  
  public String getDate() {
    return date;
  }
  
  public void setDate(String date) {
    this.date = date;
  }

  public List<StockTimePrice> getPrices() {
    return prices;
  }

  public void setPrices(List<StockTimePrice> prices) {
    this.prices = prices;
  }
}
