package com.tongna.stock.api.impl;

import com.google.gson.Gson;
import com.tongna.stock.api.HistDateApi;
import com.tongna.stock.domain.HistDateListBack;

import jodd.http.HttpRequest;
import jodd.http.HttpResponse;

public class HistDateApiImpl implements HistDateApi {

	public HistDateListBack findHistDate(String date, String code) {
		// TODO Auto-generated method stub
		String url = "http://apis.baidu.com/tehir/stockassistant/hist_date";
		HttpRequest request = HttpRequest.get(url);
		request.header("apikey", "93dc6d5e4999b89fd5dcaa6e8b52ead8");
		request.query("date", date);
		request.query("code", code);
		
		HttpResponse response = request.send();
		String body = response.body();
		Gson son = new Gson();
		HistDateListBack result = son.fromJson(body, HistDateListBack.class);
		return result;
	}

}
