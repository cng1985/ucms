package org.iwan.app;

import com.ada.iwan.apps.ObjectFactory;
import com.ada.iwan.data.service.StockService;

public class StockApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StockService service=ObjectFactory.get().getBean(StockService.class);
		service.updates();
	}

}
