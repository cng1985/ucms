package com.quhaodian.ucms.data.entity;

import com.quhaodian.data.annotations.FormAnnotation;
import com.quhaodian.data.entity.LongEntity;

import javax.persistence.*;

@FormAnnotation(title = "股票", add = "添加股票", list = "股票", update = "更新股票")
@Entity
@Table(name = "stock_day_time")
public class StockDayTime extends LongEntity {

  @ManyToOne(fetch = FetchType.LAZY)
  private Stock stock;

  @ManyToOne(fetch = FetchType.LAZY)
  private StockDay day;

  @Column(length = 4)
  private String time;

  private float price;

  private float avg;

  private int size;

  public Stock getStock() {
    return stock;
  }

  public void setStock(Stock stock) {
    this.stock = stock;
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

  public StockDay getDay() {
    return day;
  }

  public void setDay(StockDay day) {
    this.day = day;
  }
}
