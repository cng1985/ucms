package com.quhaodian.ucms.service.stock.domain;

public class StockTimePrice {
  
  private String time;
  
  private double price;
  
  private double avg;
  
  private int size;
  
  @Override
  public String toString() {
    return "StockTimePrice{" +
        "time='" + time + '\'' +
        ", price=" + price +
        ", avg=" + avg +
        ", size=" + size +
        '}';
  }
  
  public String getTime() {
    return time;
  }
  
  public void setTime(String time) {
    this.time = time;
  }
  
  public double getPrice() {
    return price;
  }
  
  public void setPrice(double price) {
    this.price = price;
  }
  
  public double getAvg() {
    return avg;
  }
  
  public void setAvg(double avg) {
    this.avg = avg;
  }
  
  public int getSize() {
    return size;
  }
  
  public void setSize(int size) {
    this.size = size;
  }
}
