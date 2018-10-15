package com.quhaodian.ucms.data.dao;


import  com.haoxuer.discover.data.core.CriteriaDao;
import  com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.core.Pagination;
import com.quhaodian.ucms.data.entity.FriendLink;

public interface FriendLinkDao extends CriteriaDao<FriendLink, Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public FriendLink findById(Long id);

	public FriendLink save(FriendLink bean);

	public FriendLink updateByUpdater(Updater<FriendLink> updater);

	public FriendLink deleteById(Long id);
}