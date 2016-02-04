package com.ada.iwan.service.stock.apps;

import java.util.List;

import com.ada.iwan.apps.ObjectFactory;
import com.ada.iwan.data.entity.Stock;
import com.ada.iwan.data.service.StockService;
import com.ada.iwan.service.stock.api.StockApi;
import com.ada.iwan.service.stock.api.impl.StockListApiImpl;
import com.ada.iwan.service.stock.domain.StockListBack;

public class StockApiApps {

	public static void main(String[] args) {
		
		StockService service=ObjectFactory.get().getBean(StockService.class);
		// TODO Auto-generated method stub
		StockApi api=new StockListApiImpl();
		StockListBack back=	api.findStcokList(1,3000);
		List<Stock> ss=	back.getRows();
		for (Stock stock : ss) {
			System.out.println(stock);
			service.save(stock);
		}
	}

}
