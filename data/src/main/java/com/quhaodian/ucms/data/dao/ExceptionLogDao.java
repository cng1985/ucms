package com.quhaodian.ucms.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.quhaodian.ucms.data.entity.ExceptionLog;

/**
* Created by imake on 2018年12月05日19:45:06.
*/
public interface ExceptionLogDao extends BaseDao<ExceptionLog,Long>{

	 ExceptionLog findById(Long id);

	 ExceptionLog save(ExceptionLog bean);

	 ExceptionLog updateByUpdater(Updater<ExceptionLog> updater);

	 ExceptionLog deleteById(Long id);
}