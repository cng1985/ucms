package com.haoxuer.ucms.data.service.impl;

import com.haoxuer.ucms.data.dao.FriendLinkDao;
import com.haoxuer.ucms.data.entity.FriendLink;
import com.haoxuer.ucms.data.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;


@Service
@Transactional
public class FriendLinkServiceImpl implements FriendLinkService {
	

	@Transactional(readOnly = true)
	public FriendLink findById(Long id) {
		FriendLink entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public FriendLink save(FriendLink bean) {
		dao.save(bean);
		return bean;
	}

    @Transactional
	public FriendLink update(FriendLink bean) {
		Updater<FriendLink> updater = new Updater<FriendLink>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public FriendLink deleteById(Long id) {
		FriendLink bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public FriendLink[] deleteByIds(Long[] ids) {
		FriendLink[] beans = new FriendLink[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private FriendLinkDao dao;

	@Autowired
	public void setDao(FriendLinkDao dao) {
		this.dao = dao;
	}
	

	
	public Page<FriendLink> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	public List<FriendLink> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}