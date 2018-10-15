package com.quhaodian.ucms.data.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.haoxuer.discover.data.entity.AbstractEntity;
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

	@Column(length = 10)
	private String day;

	@ManyToOne
	private Stock stock;


	private float price;

	private float hprice;

	private float lprive;

	private float yestPrice;

	/**
	 * 成交量
	 */
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
