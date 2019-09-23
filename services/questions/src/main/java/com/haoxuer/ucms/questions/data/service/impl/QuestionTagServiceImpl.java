package com.haoxuer.ucms.questions.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.questions.data.dao.QuestionTagDao;
import com.haoxuer.ucms.questions.data.entity.QuestionTag;
import com.haoxuer.ucms.questions.data.service.QuestionTagService;

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
public class QuestionTagServiceImpl implements QuestionTagService {

	private QuestionTagDao dao;


	@Override
	@Transactional(readOnly = true)
	public QuestionTag findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public QuestionTag save(QuestionTag bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public QuestionTag update(QuestionTag bean) {
		Updater<QuestionTag> updater = new Updater<QuestionTag>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public QuestionTag deleteById(Long id) {
		QuestionTag bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public QuestionTag[] deleteByIds(Long[] ids) {
		QuestionTag[] beans = new QuestionTag[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(QuestionTagDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<QuestionTag> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<QuestionTag> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<QuestionTag> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}