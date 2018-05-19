package com.quhaodian.ucms.data.dao;


import  com.quhaodian.data.core.BaseDao;
import  com.quhaodian.data.core.Updater;
import  com.quhaodian.ucms.data.entity.StockDayTime;

/**
* Created by imake on 2018年05月19日21:36:17.
*/
public interface StockDayTimeDao extends BaseDao<StockDayTime,Long>{

	 StockDayTime findById(Long id);

	StockDayTime findByDay(Long id,String time);


	StockDayTime save(StockDayTime bean);

	 StockDayTime updateByUpdater(Updater<StockDayTime> updater);

	 StockDayTime deleteById(Long id);
}