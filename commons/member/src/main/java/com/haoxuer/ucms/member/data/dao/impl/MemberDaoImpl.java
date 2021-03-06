package com.haoxuer.ucms.member.data.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.haoxuer.ucms.member.data.dao.MemberDao;
import com.haoxuer.ucms.member.data.entity.Member;

/**
* Created by imake on 2019年09月22日16:06:49.
*/
@Repository

public class MemberDaoImpl extends CriteriaDaoImpl<Member, Long> implements MemberDao {

	@Override
	public Member findById(Long id) {
	    if (id==null) {
			return null;
		}
		return get(id);
	}

	@Override
	public Member save(Member bean) {

        getSession().save(bean);
		
		
		return bean;
	}

    @Override
	public Member deleteById(Long id) {
		Member entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<Member> getEntityClass() {
		return Member.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}