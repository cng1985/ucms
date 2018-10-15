package com.quhaodian.ucms.rest.resources;

import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.rest.base.RequestTokenPageObject;
import com.quhaodian.ucms.data.dao.MemberDao;
import com.quhaodian.ucms.data.entity.Member;
import com.quhaodian.ucms.rest.api.MemberApi;
import com.quhaodian.ucms.rest.conver.MemberSimpleConver;
import com.quhaodian.ucms.rest.conver.PageableConver;
import com.quhaodian.ucms.rest.domain.page.MemberPage;
import com.quhaodian.ucms.rest.domain.request.PageRequest;
import com.haoxuer.discover.user.utils.ConverResourceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public class MemberResource implements MemberApi {
  
  @Autowired
  private MemberDao memberDao;
  
  @Override
  public MemberPage page(PageRequest request) {
    MemberPage result = new MemberPage();
    Pageable pageable = new PageableConver().conver(request);
    Page<Member> page = memberDao.page(pageable);
    ConverResourceUtils.coverPage(result, page, new MemberSimpleConver());
    return result;
  }
}
