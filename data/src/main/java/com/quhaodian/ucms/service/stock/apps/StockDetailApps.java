package com.quhaodian.ucms.service.stock.apps;

import com.quhaodian.ucms.apps.ObjectFactory;
import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.ucms.data.service.StockDetailService;
import com.quhaodian.ucms.service.stock.api.impl.StockListApiImpl;
import com.quhaodian.ucms.service.stock.domain.StockDetailBack;
import org.springframework.beans.BeanUtils;

import com.quhaodian.ucms.apps.ObjectFactory;
import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.ucms.data.service.StockDetailService;
import com.quhaodian.ucms.service.stock.api.StockApi;
import com.quhaodian.ucms.service.stock.api.impl.StockListApiImpl;
import com.quhaodian.ucms.service.stock.domain.StockDetailBack;

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
