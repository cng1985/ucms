package org.iwan.app;

import java.math.BigDecimal;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import jodd.http.HttpRequest;
import jodd.http.HttpResponse;

public class StockApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		for (int i = 1; i < 2788; i++) {
//			HttpRequest httpRequest = HttpRequest.get("http://www.yichisancun.com/stock/view/"+i+".htm");
//		    HttpResponse response = httpRequest.send();
//		}
		//BeanUtils.copyProperties(dest, orig);
		
		Converter converter=new Converter() {
			
			@Override
			public <T> T convert(Class<T> arg0, Object arg1) {
				
				if (arg0.getName().equals(BigDecimal.class.getName())) {
					System.out.println("");
					
					
				}
				
				return null;
			}
		};
		ConvertUtils.register(converter, BigDecimal.class);
	}

}
