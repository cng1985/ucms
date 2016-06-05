package org.iwan.app;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import com.ada.iwan.data.convers.BigDecimalConverter;
import com.ada.iwan.data.entity.StockDay;
import com.ada.iwan.data.entity.StockDetail;
//import org.apache.commons.beanutils.converters.BigDecimalConverter;

public class BeanApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ConvertUtils.register(new BigDecimalConverter(), BigDecimal.class);
		
		Converter c=	ConvertUtils.lookup(BigDecimal.class);
		System.out.println(c);
		StockDetail d=new StockDetail();
		d.sethPrice(1.0f);
		StockDay day=new StockDay();
		
		try {
			BeanUtils.copyProperties(day,d );
			System.out.println(day.gethPrice());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
