package com.quhaodian.ucms.service.stock.domain;

public class StockTimePrice {
  
  private String time;
  
  private float price;
  
  private float avg;
  
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
  
  public float getPrice() {
    return price;
  }
  
  public void setPrice(float price) {
    this.price = price;
  }
  
  public float getAvg() {
    return avg;
  }
  
  public void setAvg(float avg) {
    this.avg = avg;
  }
  
  public int getSize() {
    return size;
  }
  
  public void setSize(int size) {
    this.size = size;
  }
}
