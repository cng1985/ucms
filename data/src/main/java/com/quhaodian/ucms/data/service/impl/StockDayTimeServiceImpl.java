package com.quhaodian.ucms.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.quhaodian.ucms.data.dao.StockDayTimeDao;
import com.quhaodian.ucms.data.entity.StockDayTime;
import com.quhaodian.ucms.data.service.StockDayTimeService;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;
import java.util.LinkedList;
import java.util.ArrayList;
import com.haoxuer.discover.data.utils.FilterUtils;
import org.springframework.context.annotation.Scope;


/**
* Created by imake on 2018年05月19日21:36:17.
*/


@Scope("prototype")
@Service
@Transactional
public class StockDayTimeServiceImpl implements StockDayTimeService {

	private StockDayTimeDao dao;


	@Override
	@Transactional(readOnly = true)
	public StockDayTime findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public StockDayTime save(StockDayTime bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public StockDayTime update(StockDayTime bean) {
		Updater<StockDayTime> updater = new Updater<StockDayTime>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public StockDayTime deleteById(Long id) {
		StockDayTime bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public StockDayTime[] deleteByIds(Long[] ids) {
		StockDayTime[] beans = new StockDayTime[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(StockDayTimeDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<StockDayTime> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<StockDayTime> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<StockDayTime> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}