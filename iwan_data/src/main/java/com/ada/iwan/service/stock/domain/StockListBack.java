package com.ada.iwan.service.stock.domain;

import java.util.List;

import com.ada.iwan.data.entity.Stock;

public class StockListBack extends Back {
	/**
	 * 创建一个股票信息集合
	 * 
	 */
	private List<Stock> rows;

	public List<Stock> getRows() {
		return rows;
	}

	public void setRows(List<Stock> rows) {
		this.rows = rows;
	}
}
