package com.haoxuer.ucms.service.factory;

import com.google.gson.Gson;

public class JsonFactory {
	/**
	 * 创建Gson
	 * @return
	 */
	public Gson gson() {
		Gson gson = new Gson();
		return gson;
	}
}
