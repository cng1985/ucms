package com.haoxuer.ucms.questions.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.ucms.questions.data.dao.QuestionAnswerVoteDao;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswerVote;
import com.haoxuer.ucms.questions.data.service.QuestionAnswerVoteService;

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
public class QuestionAnswerVoteServiceImpl implements QuestionAnswerVoteService {

	private QuestionAnswerVoteDao dao;


	@Override
	@Transactional(readOnly = true)
	public QuestionAnswerVote findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public QuestionAnswerVote save(QuestionAnswerVote bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public QuestionAnswerVote update(QuestionAnswerVote bean) {
		Updater<QuestionAnswerVote> updater = new Updater<QuestionAnswerVote>(bean);
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public QuestionAnswerVote deleteById(Long id) {
		QuestionAnswerVote bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public QuestionAnswerVote[] deleteByIds(Long[] ids) {
		QuestionAnswerVote[] beans = new QuestionAnswerVote[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(QuestionAnswerVoteDao dao) {
		this.dao = dao;
	}

	@Override
    public Page<QuestionAnswerVote> page(Pageable pageable){
         return dao.page(pageable);
    }


    @Override
	public Page<QuestionAnswerVote> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}

    @Override
    public List<QuestionAnswerVote> list(int first, Integer size, List<Filter> filters, List<Order> orders) {
        return dao.list(first,size,filters,orders);}
}