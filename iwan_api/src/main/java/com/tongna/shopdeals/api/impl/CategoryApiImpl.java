package com.tongna.shopdeals.api.impl;

import com.google.gson.Gson;
import com.tongna.common.factory.JsonFactory;
import com.tongna.shopdeals.Config;
import com.tongna.shopdeals.api.CategoryApi;
import com.tongna.shopdeals.domain.CategoriesListBack;

import jodd.http.HttpRequest;
import jodd.http.HttpResponse;

public class CategoryApiImpl implements CategoryApi {

	public CategoriesListBack findCategoriesApi() {
		// TODO Auto-generated method stub
		String url="http://apis.baidu.com/baidunuomi/openapi/categories";
		HttpRequest httpRequest = HttpRequest.get(url);
		httpRequest.header("apikey", Config.getApikey());
		
		HttpResponse response = httpRequest.send();
		String body = response.body();
		JsonFactory f = new JsonFactory();
		Gson gson = f.gson();
		CategoriesListBack result = gson.fromJson(body, CategoriesListBack.class);
		return result;
	}

}
