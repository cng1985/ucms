package com.haoxuer.ucms.rest.api;

import com.haoxuer.ucms.rest.domain.page.MemberPage;
import com.haoxuer.ucms.rest.domain.request.MemberNameRequest;
import com.haoxuer.ucms.rest.domain.request.PageRequest;
import com.quhaodian.jsonrpc.annotation.RestFul;

/**
 * 用户api
 */
@RestFul(value = "memberApi", api = MemberApi.class)
public interface MemberApi {
  
  /**
   * 获取系统的用户
   *
   * @param request
   * @return
   */
  MemberPage page(PageRequest request);

  MemberPage name(MemberNameRequest request);

}
