package com.quhaodian.ucms.rest.domain.request;

import com.haoxuer.discover.rest.base.RequestTokenPageObject;

public class MemberNameRequest extends PageRequest {
  
  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
