package com.haoxuer.ucms.questions.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.questions.data.dao.QuestionCatalogDao;
import com.haoxuer.ucms.questions.data.entity.QuestionCatalog;
import com.haoxuer.ucms.questions.data.service.QuestionCatalogService;

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
* Created by imake on 2019年09月23日11:38:26.
*/


@Scope("prototype")
@Service
@Transactional
public class QuestionCatalogServiceImpl implements QuestionCatalogService {

	private QuestionCatalogDao dao;


	@Override
	@Transactional(readOnly = true)
	public QuestionCatalog findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public List<QuestionCatalog> findByTops(Integer pid) {
		LinkedList<QuestionCatalog> result = new LinkedList<QuestionCatalog>();
		QuestionCatalog catalog = dao.findById(pid);
	    if(catalog != null){
			while ( catalog != null && catalog.getParent() != null ) {
				result.addFirst(catalog);
				catalog = dao.findById(catalog.getParentId());
			}
			result.addFirst(catalog);
	    }
		return result;
	}


    @Override
    public List<QuestionCatalog> child(Integer id,Integer max) {
        List<Order> orders=new ArrayList<Order>();
        orders.add(Order.asc("code"));
        List<Filter> list=new ArrayList<Filter>();
        list.add(Filter.eq("parent.id",id));
        return dao.list(0,max,list,orders);
	}

	@Override
    @Transactional
	public QuestionCatalog save(QuestionCatalog bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public QuestionCatalog update(QuestionCatalog bean) {
		Updater<QuestionCatalog> updater = new Updater<QuestionCatalog>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public QuestionCatalog deleteById(Integer id) {
		QuestionCatalog bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public QuestionCatalog[] deleteByIds(Integer[] ids) {
		QuestionCatalog[] beans = new QuestionCatalog[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(QuestionCatalogDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<QuestionCatalog> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<QuestionCatalog> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<QuestionCatalog> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}