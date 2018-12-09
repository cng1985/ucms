package com.quhaodian.ucms.rest.api;

import com.quhaodian.jsonrpc.annotation.RestFul;
import com.quhaodian.ucms.rest.domain.page.MemberPage;
import com.quhaodian.ucms.rest.domain.request.MemberNameRequest;
import com.quhaodian.ucms.rest.domain.request.PageRequest;

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
