package com.haoxuer.ucms.rest.domain.request;

public class MemberNameRequest extends PageRequest {
  
  private String name;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
