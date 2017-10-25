package com.ada.ucms.data.service;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.ucms.data.entity.Member;

import java.util.List;

/**
* Created by imake on 2017年06月17日12:50:59.
*/
public interface MemberService {

	public Member findById(Long id);

	public Member save(Member bean);

	public Member update(Member bean);

	public Member deleteById(Long id);
	
	public Member[] deleteByIds(Long[] ids);
	
	public Page<Member> findPage(Pageable pageable);
	
	public Page<Member> page(Pageable pageable);
	
	public Page<Member> page(Pageable pageable, Object search);

	public long count(Filter... filters);


	public List<Member> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}