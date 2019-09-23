package com.haoxuer.ucms.questions.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.questions.data.dao.QuestionDao;
import com.haoxuer.ucms.questions.data.entity.Question;
import com.haoxuer.ucms.questions.data.service.QuestionService;

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
public class QuestionServiceImpl implements QuestionService {

	private QuestionDao dao;


	@Override
	@Transactional(readOnly = true)
	public Question findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public Question save(Question bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public Question update(Question bean) {
		Updater<Question> updater = new Updater<Question>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public Question deleteById(Long id) {
		Question bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public Question[] deleteByIds(Long[] ids) {
		Question[] beans = new Question[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(QuestionDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<Question> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<Question> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<Question> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}