package com.haoxuer.ucms.data.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.haoxuer.discover.data.entity.AbstractEntity;
import com.haoxuer.discover.user.data.entity.UserInfo;

/**
 * 股票笔记
 * 
 * @author cng19
 *
 */
@Entity
@Table(name = "stock_note")
public class StockNote extends AbstractEntity {

	/**
	 * 用户
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uid")
	private UserInfo user;

	/**
	 * 做笔记的股票
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stock_id")
	private Stock stock;

	/**
	 * 笔记内容
	 */
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
