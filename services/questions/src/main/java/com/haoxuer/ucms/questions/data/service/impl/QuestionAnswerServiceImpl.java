package com.haoxuer.ucms.questions.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.questions.data.dao.QuestionAnswerDao;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;
import com.haoxuer.ucms.questions.data.service.QuestionAnswerService;

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
public class QuestionAnswerServiceImpl implements QuestionAnswerService {

	private QuestionAnswerDao dao;


	@Override
	@Transactional(readOnly = true)
	public QuestionAnswer findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public QuestionAnswer save(QuestionAnswer bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public QuestionAnswer update(QuestionAnswer bean) {
		Updater<QuestionAnswer> updater = new Updater<QuestionAnswer>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public QuestionAnswer deleteById(Long id) {
		QuestionAnswer bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public QuestionAnswer[] deleteByIds(Long[] ids) {
		QuestionAnswer[] beans = new QuestionAnswer[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(QuestionAnswerDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<QuestionAnswer> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<QuestionAnswer> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<QuestionAnswer> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}