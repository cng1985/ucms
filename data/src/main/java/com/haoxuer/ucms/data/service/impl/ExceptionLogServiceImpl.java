package com.haoxuer.ucms.data.service.impl;

import com.haoxuer.ucms.data.dao.ExceptionLogDao;
import com.haoxuer.ucms.data.entity.ExceptionLog;
import com.haoxuer.ucms.data.service.ExceptionLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

import com.haoxuer.discover.data.utils.FilterUtils;
import org.springframework.context.annotation.Scope;


/**
* Created by imake on 2018年12月05日19:45:06.
*/


@Scope("prototype")
@Service
@Transactional
public class ExceptionLogServiceImpl implements ExceptionLogService {

	private ExceptionLogDao dao;


	@Override
	@Transactional(readOnly = true)
	public ExceptionLog findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public ExceptionLog save(ExceptionLog bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public ExceptionLog update(ExceptionLog bean) {
		Updater<ExceptionLog> updater = new Updater<ExceptionLog>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public ExceptionLog deleteById(Long id) {
		ExceptionLog bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public ExceptionLog[] deleteByIds(Long[] ids) {
		ExceptionLog[] beans = new ExceptionLog[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(ExceptionLogDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<ExceptionLog> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<ExceptionLog> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<ExceptionLog> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}