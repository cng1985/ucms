package com.haoxuer.ucms.questions.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.questions.data.dao.QuestionWordDao;
import com.haoxuer.ucms.questions.data.entity.QuestionWord;
import com.haoxuer.ucms.questions.data.service.QuestionWordService;

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
public class QuestionWordServiceImpl implements QuestionWordService {

	private QuestionWordDao dao;


	@Override
	@Transactional(readOnly = true)
	public QuestionWord findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public QuestionWord save(QuestionWord bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public QuestionWord update(QuestionWord bean) {
		Updater<QuestionWord> updater = new Updater<QuestionWord>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public QuestionWord deleteById(Long id) {
		QuestionWord bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public QuestionWord[] deleteByIds(Long[] ids) {
		QuestionWord[] beans = new QuestionWord[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(QuestionWordDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<QuestionWord> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<QuestionWord> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<QuestionWord> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}