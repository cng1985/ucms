package com.quhaodian.ucms.data.service;

import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.entity.FriendLink;

import java.util.List;

public interface FriendLinkService {

	public FriendLink findById(Long id);

	public FriendLink save(FriendLink bean);

	public FriendLink update(FriendLink bean);

	public FriendLink deleteById(Long id);
	
	public FriendLink[] deleteByIds(Long[] ids);
	

	public Page<FriendLink> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<FriendLink> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}