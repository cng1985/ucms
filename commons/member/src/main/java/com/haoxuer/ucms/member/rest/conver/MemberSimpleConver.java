package com.haoxuer.ucms.member.rest.conver;

import com.haoxuer.discover.data.rest.core.Conver;
import com.haoxuer.ucms.member.api.domain.simple.MemberSimple;
import com.haoxuer.ucms.member.data.entity.Member;

public class MemberSimpleConver implements Conver<MemberSimple, Member> {
    @Override
    public MemberSimple conver(Member source) {
        MemberSimple result=new MemberSimple();
        result.setAvatar(source.getAvatar());
        result.setName(source.getName());
        return result;
    }
}
