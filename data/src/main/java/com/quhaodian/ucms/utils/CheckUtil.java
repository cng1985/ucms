package com.quhaodian.ucms.utils;

import com.haoxuer.discover.data.entity.LongEntity;
import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CheckUtil {

  private static Logger logger = LoggerFactory.getLogger(CheckUtil.class);

  public static boolean check(UserInfo user) {
    boolean result = false;
    if (user == null || user.getId() == null) {
      return result;
    }
    UserInfo old = UserUtil.getCurrentUser();
    if (old == null || old.getId() == null) {
      return result;
    }
    Long id = UserUtil.getCurrentUser().getId();
    if (id.equals(user.getId())) {
      result = true;
      return result;
    }

    return result;
  }

  public static boolean unCheck(UserInfo user) {
    return !check(user);
  }


}
