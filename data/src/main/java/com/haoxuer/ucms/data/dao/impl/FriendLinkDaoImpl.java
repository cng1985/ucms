package com.haoxuer.ucms.data.dao.impl;

import com.haoxuer.ucms.data.dao.FriendLinkDao;
import com.haoxuer.ucms.data.entity.FriendLink;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.discover.data.core.Pagination;

@Repository
public class FriendLinkDaoImpl extends CriteriaDaoImpl<FriendLink, Long> implements FriendLinkDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public FriendLink findById(Long id) {
		FriendLink entity = get(id);
		return entity;
	}

	public FriendLink save(FriendLink bean) {
		getSession().save(bean);
		return bean;
	}

	public FriendLink deleteById(Long id) {
		FriendLink entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<FriendLink> getEntityClass() {
		return FriendLink.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}