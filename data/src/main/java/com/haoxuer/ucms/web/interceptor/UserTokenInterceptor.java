package com.haoxuer.ucms.web.interceptor;

import com.haoxuer.ucms.exception.NoUserTokenException;
import com.haoxuer.ucms.exception.UnAuthorizationException;
import com.haoxuer.discover.user.utils.UserUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserTokenInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    String token = request.getParameter("userToken");
    if (token == null) {
      throw new NoUserTokenException();
    }
    Long app = UserUtils.getApp(token);
    if (app == null) {
      throw new UnAuthorizationException();
    }
    return true;
  }
}
