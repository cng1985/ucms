package com.tongna.shopdeals.api.impl;

import com.google.gson.Gson;
import com.tongna.common.factory.JsonFactory;
import com.tongna.shopdeals.Config;
import com.tongna.shopdeals.api.CityApi;
import com.tongna.shopdeals.domain.CitiesListBack;
import com.tongna.shopdeals.domain.DistrictsListBack;

import jodd.http.HttpRequest;
import jodd.http.HttpResponse;

public class CityApiImpl implements CityApi {

	public CitiesListBack findAll() {
		// TODO Auto-generated method stub
		String url="http://apis.baidu.com/baidunuomi/openapi/cities";
		HttpRequest httpRequest = HttpRequest.get(url);
		httpRequest.header("apikey", Config.getApikey());
		
		HttpResponse response = httpRequest.send();
		String body = response.body();
		JsonFactory f = new JsonFactory();
		Gson gson = f.gson();
		CitiesListBack result = gson.fromJson(body, CitiesListBack.class);
		return result;
	
	}
	
	public DistrictsListBack findDistricts(Integer city_id) {
		// TODO Auto-generated method stub
		String url="http://apis.baidu.com/baidunuomi/openapi/districts";
		HttpRequest httpRequest = HttpRequest.get(url);
		httpRequest.header("apikey", Config.getApikey());
		httpRequest.query("city_id", ""+city_id);
				
		HttpResponse response = httpRequest.send();
		String body = response.body();
		JsonFactory f = new JsonFactory();
		Gson gson = f.gson();
		DistrictsListBack result = gson.fromJson(body, DistrictsListBack.class);
		return result;
	}

}
