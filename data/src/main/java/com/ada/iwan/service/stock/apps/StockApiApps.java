package com.ada.iwan.service.stock.apps;

import com.ada.iwan.data.service.StockService;
import com.ada.iwan.service.stock.api.StockApi;
import com.ada.iwan.service.stock.api.impl.StockListApiImpl;
import com.ada.iwan.service.stock.domain.StockBack;
import com.ada.iwan.service.stock.domain.StockDetailBack;
import com.ada.iwan.service.stock.domain.StockListBack;

import java.util.List;

public class StockApiApps {

	public static void main(String[] args) {

		StockApi api = new StockListApiImpl();
		StockDetailBack back = api.findByCode("603268");
		System.out.println(back);
	}

	/**
	 * 
	 */
	private static void lsit() {
		StockService service = getService();
		// TODO Auto-generated method stub
		StockApi api = new StockListApiImpl();
		StockListBack back = api.findStcokList(1, 3000);
		List<StockBack> ss = back.getRows();
		for (StockBack stock : ss) {
			System.out.println(stock);
			// service.save(stock);
		}
	}

	/**
	 * @return
	 */
	private static StockService getService() {
		// StockService service=ObjectFactory.get().getBean(StockService.class);
		StockService service = null;
		return service;
	}

}
