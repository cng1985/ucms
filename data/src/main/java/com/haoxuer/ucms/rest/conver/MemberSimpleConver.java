package com.haoxuer.ucms.rest.conver;

import com.haoxuer.discover.data.rest.core.Conver;
import com.haoxuer.ucms.rest.domain.simple.MemberSimple;
import com.haoxuer.ucms.data.entity.Member;

public class MemberSimpleConver implements Conver<MemberSimple, Member> {
  @Override
  public MemberSimple conver(Member source) {
    MemberSimple result = new MemberSimple();
    result.setId(source.getId());
    result.setName(source.getName());
    return result;
  }
}
