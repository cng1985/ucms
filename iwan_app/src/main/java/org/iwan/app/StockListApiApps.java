package org.iwan.app;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.ada.iwan.apps.ObjectFactory;
import com.ada.iwan.data.entity.Stock;
import com.ada.iwan.data.service.StockService;
import com.tongna.stock.api.StockListApi;
import com.tongna.stock.api.impl.StockListApiImpl;
import com.tongna.stock.domain.StockListBack;
import com.tongna.stock.domain.Stocklist;

public class StockListApiApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StockService service = ObjectFactory.get().getBean(StockService.class);

		StockListApi api = new StockListApiImpl();
		StockListBack back = api.findStcokList(1, 3000);
		List<Stocklist> ss = back.getRows();
		for (Stocklist stocklist : ss) {
			Stock bean=new Stock();
			try {
				BeanUtils.copyProperties( bean,stocklist);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			service.save(bean);
		}
	}

}
