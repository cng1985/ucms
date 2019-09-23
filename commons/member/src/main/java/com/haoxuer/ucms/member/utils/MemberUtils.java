package com.haoxuer.ucms.member.utils;

import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.ucms.member.data.entity.Member;

public class MemberUtils {

    public static Member member() {
        Member result = new Member();
        UserInfo user = UserUtil.getCurrentUser();
        if (user != null) {
            result = new Member();
            result.setId(user.getId());
            result.setName(user.getName());
            result.setAvatar(user.getAvatar());
        }
        return result;
    }
}
