package com.haoxuer.ucms.data.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.haoxuer.discover.data.annotations.ColType;
import com.haoxuer.discover.data.annotations.FormFieldAnnotation;
import com.haoxuer.discover.data.entity.LongEntity;

/**
 * 股票每天多次记录
 * 
 * @author cng19
 *
 */
@Entity
@Table(name = "stock_day")
public class StockDay extends LongEntity {

	@FormFieldAnnotation(title = "日期", sortNum = "1", grid = true, col = ColType.col_2)
	@Column(length = 10)
	private String day;

	@FormFieldAnnotation(title = "股票", sortNum = "2", grid = true, col = ColType.col_2)
	@ManyToOne
	private Stock stock;

	@FormFieldAnnotation(title = "收盘价", sortNum = "5", grid = true, col = ColType.col_1)
	private float price;

	@FormFieldAnnotation(title = "最高价", sortNum = "3", grid = true, col = ColType.col_1)
	private float hprice;

	@FormFieldAnnotation(title = "最低价", sortNum = "4", grid = true, col = ColType.col_1)
	private float lprive;

	@FormFieldAnnotation(title = "昨日价", sortNum = "6", grid = true, col = ColType.col_1)
	private float yestPrice;

	/**
	 * 成交量
	 */
	@FormFieldAnnotation(title = "成交量", sortNum = "7", grid = true, col = ColType.col_2)
	private int volume;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getHprice() {
		return hprice;
	}

	public void setHprice(float hprice) {
		this.hprice = hprice;
	}

	public float getLprive() {
		return lprive;
	}

	public void setLprive(float lprive) {
		this.lprive = lprive;
	}

	public float getYestPrice() {
		return yestPrice;
	}

	public void setYestPrice(float yestPrice) {
		this.yestPrice = yestPrice;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}
}
