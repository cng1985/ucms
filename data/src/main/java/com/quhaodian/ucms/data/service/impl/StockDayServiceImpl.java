package com.quhaodian.ucms.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.quhaodian.ucms.data.dao.StockDayDao;
import com.quhaodian.ucms.data.entity.StockDay;
import com.quhaodian.ucms.data.service.StockDayService;

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
* Created by imake on 2018年12月05日17:51:09.
*/


@Scope("prototype")
@Service
@Transactional
public class StockDayServiceImpl implements StockDayService {

	private StockDayDao dao;


	@Override
	@Transactional(readOnly = true)
	public StockDay findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public StockDay save(StockDay bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public StockDay update(StockDay bean) {
		Updater<StockDay> updater = new Updater<StockDay>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public StockDay deleteById(Long id) {
		StockDay bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public StockDay[] deleteByIds(Long[] ids) {
		StockDay[] beans = new StockDay[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(StockDayDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<StockDay> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<StockDay> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<StockDay> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}