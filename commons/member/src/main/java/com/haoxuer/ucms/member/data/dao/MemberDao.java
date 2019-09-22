package com.haoxuer.ucms.member.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.member.data.entity.Member;

/**
* Created by imake on 2019年09月22日16:06:49.
*/
public interface MemberDao extends BaseDao<Member,Long>{

	 Member findById(Long id);

	 Member save(Member bean);

	 Member updateByUpdater(Updater<Member> updater);

	 Member deleteById(Long id);
}