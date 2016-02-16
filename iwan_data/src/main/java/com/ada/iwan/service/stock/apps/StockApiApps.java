package com.ada.iwan.service.stock.apps;

import java.util.List;

import com.ada.iwan.apps.ObjectFactory;
import com.ada.iwan.data.entity.Stock;
import com.ada.iwan.data.service.StockService;
import com.ada.iwan.service.stock.api.StockApi;
import com.ada.iwan.service.stock.api.impl.StockListApiImpl;
import com.ada.iwan.service.stock.domain.StockListBack;
import com.ada.iwan.utils.RpcUtils;

public class StockApiApps {

	public static void main(String[] args) {
		
		StockService service = getService();
		// TODO Auto-generated method stub
		StockApi api=new StockListApiImpl();
		StockListBack back=	api.findStcokList(1,3000);
		List<Stock> ss=	back.getRows();
		for (Stock stock : ss) {
			System.out.println(stock);
			service.save(stock);
		}
	}

	/**
	 * @return
	 */
	private static StockService getService() {
		//StockService service=ObjectFactory.get().getBean(StockService.class);
		StockService service=RpcUtils.get(StockService.class);
		return service;
	}

}
