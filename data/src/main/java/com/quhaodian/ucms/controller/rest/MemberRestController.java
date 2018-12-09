package com.quhaodian.ucms.controller.rest;


import com.quhaodian.ucms.rest.api.MemberApi;
import com.quhaodian.ucms.rest.domain.page.MemberPage;
import com.quhaodian.ucms.rest.domain.request.MemberNameRequest;
import com.quhaodian.ucms.rest.domain.request.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/rest")
@RestController
public class MemberRestController {
  
  @RequestMapping("/member/page")
  public MemberPage page(PageRequest request) {
    return api.page(request);
  }

  @RequestMapping("/member/name")
  public MemberPage name(MemberNameRequest request) {
    return api.name(request);
  }

  @Autowired
  private MemberApi api;
  
  
}
