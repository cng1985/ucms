package com.ada.iwan.data.entity;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ada.data.entity.AbstractEntity;
import com.ada.user.entity.UserInfo;
@Entity
@Table(name = "stock_note")
public class StockNote extends AbstractEntity {

	/**
	 * 用户
	 */
	@ManyToOne
	private UserInfo user;
	
	/**
	 * 做笔记的股票
	 */
	@ManyToOne
	private Stock stock;
	
	private String note;

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
}
