package com.quhaodian.ucms.data.service.impl;

import com.quhaodian.ucms.data.dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.quhaodian.ucms.data.dao.MemberDao;
import com.quhaodian.ucms.data.entity.Member;
import com.quhaodian.ucms.data.service.MemberService;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

import com.haoxuer.discover.data.utils.FilterUtils;


/**
* Created by imake on 2017年06月17日12:50:59.
*/
@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	private MemberDao dao;


	@Override
	@Transactional(readOnly = true)
	public Member findById(Long id) {
		return dao.findById(id);
	}


	@Override
    @Transactional
	public Member save(Member bean) {
		dao.save(bean);
		return bean;
	}

	@Override
    @Transactional
	public Member update(Member bean) {
		Updater<Member> updater = new Updater<Member>(bean);
		updater.exclude("attributes");
		updater.exclude("roles");
		updater.exclude("labels");
		return dao.updateByUpdater(updater);
	}

	@Override
    @Transactional
	public Member deleteById(Long id) {
		Member bean = dao.findById(id);
        dao.deleteById(id);
		return bean;
	}

	@Override
    @Transactional	
	public Member[] deleteByIds(Long[] ids) {
		Member[] beans = new Member[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}


	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@Override
	@Transactional(readOnly = true)
	public Page<Member> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Override
    public Page<Member> page(Pageable pageable){
         return dao.page(pageable);
    }

	@Override
	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     return dao.count(filters);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Member> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
		return dao.findList(first,count,filters,orders);
	}

    @Override
	public Page<Member> page(Pageable pageable, Object search) {
		List<Filter> filters=	FilterUtils.getFilters(search);
		if (filters!=null) {
			pageable.getFilters().addAll(filters);
		}
		return dao.page(pageable);
	}
}