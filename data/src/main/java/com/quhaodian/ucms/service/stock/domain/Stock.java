package com.quhaodian.ucms.service.stock.domain;

import java.io.Serializable;

public class Stock implements Serializable {
  
  /**
   * 股票代码
   */
  private String symbol;
  /**
   * 股票名称
   */
  private String name;
  
  private double yestClose;
  
  private int lastVolume;
  
  private String date;
  
  @Override
  public String toString() {
    return "Stock{" +
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
  
  public double getYestClose() {
    return yestClose;
  }
  
  public void setYestClose(double yestClose) {
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
}
