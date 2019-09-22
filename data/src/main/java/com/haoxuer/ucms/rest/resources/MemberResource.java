package com.haoxuer.ucms.rest.resources;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.ucms.rest.domain.request.MemberNameRequest;
import com.haoxuer.ucms.rest.domain.request.PageRequest;
import com.haoxuer.ucms.data.dao.MemberDao;
import com.haoxuer.ucms.data.entity.Member;
import com.haoxuer.ucms.rest.api.MemberApi;
import com.haoxuer.ucms.rest.conver.MemberSimpleConver;
import com.haoxuer.ucms.rest.conver.PageableConver;
import com.haoxuer.ucms.rest.domain.page.MemberPage;
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

  @Override
  public MemberPage name(MemberNameRequest request) {
    MemberPage result = new MemberPage();
    if (request.getName() == null) {
      request.setName("");
    }
    Pageable pageable = new PageableConver().conver(request);
    pageable.getFilters().add(Filter.like("name", request.getName()));
    Page<Member> page = memberDao.page(pageable);
    ConverResourceUtils.coverPage(result, page, new MemberSimpleConver());
    return result;
  }
}
