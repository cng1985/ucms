package com.haoxuer.ucms.member.data.service;

import com.haoxuer.discover.rest.base.ResponseObject;
import com.haoxuer.discover.user.data.entity.UserAccount;
import com.haoxuer.discover.user.data.vo.UserAccountVo;
import com.haoxuer.ucms.member.data.entity.Member;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.ucms.member.data.request.MemberUpdateRequest;

import java.util.List;

/**
* Created by imake on 2019年09月22日16:06:49.
*/
public interface MemberService {

	Member findById(Long id);

	Member save(Member bean);

	Member update(Member bean);

	Member deleteById(Long id);
	
	Member[] deleteByIds(Long[] ids);
	
	Page<Member> page(Pageable pageable);
	
	Page<Member> page(Pageable pageable, Object search);


	List<Member> list(int first, Integer size, List<Filter> filters, List<Order> orders);

	/**
	 * 更新个人信息
	 *
	 * @param request
	 * @return
	 */
	ResponseObject update(MemberUpdateRequest request);


	UserAccountVo reg(UserAccount account, Member member);
}