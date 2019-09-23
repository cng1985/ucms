package com.haoxuer.ucms.member.data.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class MemberUpdateRequest implements Serializable {
  
  private Long id;
  
  private String name;
  
  private String sex;
  
  private String avatar;
  
  private String phone;
  
  private String email;
  
  private String job;
  
  private String companyName;
  
  private String introduce;
  
}
