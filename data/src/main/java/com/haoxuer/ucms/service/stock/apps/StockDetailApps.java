package com.haoxuer.ucms.service.stock.apps;

import com.haoxuer.ucms.data.entity.StockDetail;
import com.haoxuer.ucms.data.service.StockDetailService;
import com.haoxuer.ucms.service.stock.api.StockApi;
import com.haoxuer.ucms.service.stock.domain.StockDetailBack;
import com.haoxuer.ucms.apps.ObjectFactory;
import com.haoxuer.ucms.service.stock.api.impl.StockListApiImpl;
import org.springframework.beans.BeanUtils;

public class StockDetailApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StockDetailService ser= ObjectFactory.get().getBean(StockDetailService.class);
		
		StockDetail bean=new StockDetail();
		
		StockApi api = new StockListApiImpl();
		StockDetailBack back = api.findByCode("603268");
         BeanUtils.copyProperties(back, bean);
		ser.save(bean);
	}

}
