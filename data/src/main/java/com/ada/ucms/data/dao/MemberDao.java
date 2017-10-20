package com.ada.ucms.data.dao;


import  com.ada.data.core.CriteriaDao;
import  com.ada.data.core.Updater;
import  com.ada.ucms.data.entity.Member;

/**
* Created by imake on 2017年06月17日12:50:59.
*/
public interface MemberDao extends CriteriaDao<Member,Long>{

	public Member findById(Long id);

	public Member save(Member bean);

	public Member updateByUpdater(Updater<Member> updater);

	public Member deleteById(Long id);
}