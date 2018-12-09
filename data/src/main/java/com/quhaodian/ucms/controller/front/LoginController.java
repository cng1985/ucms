/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
 */

package com.quhaodian.ucms.controller.front;

import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.user.data.entity.UserOauthToken;
import com.haoxuer.discover.user.data.enums.BindType;
import com.haoxuer.discover.user.data.request.UserRegisterRequest;
import com.haoxuer.discover.user.data.response.UserBasicResponse;
import com.haoxuer.discover.user.data.service.UserAccountService;
import com.haoxuer.discover.user.data.service.UserInfoService;
import com.haoxuer.discover.user.data.service.UserOauthTokenService;
import com.haoxuer.discover.user.oauth.domain.OauthResponse;
import com.haoxuer.discover.user.shiro.realm.UserInfoToken;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.useroauth.plugs.service.OauthSiteService;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录页
 *
 * @author langhsu
 */
@Controller
public class LoginController extends BaseController {

  @Autowired
  OauthSiteService oauthSiteService;

  /**
   * 退出登录
   *
   * @return
   */
  @RequestMapping("/signout")
  public String signout() {
    SecurityUtils.getSubject().logout();
    return "redirect:/login.htm";
  }

  @Autowired
  UserInfoService userInfoService;

  @Autowired
  UserAccountService accountService;

  @Autowired
  UserOauthTokenService tokenService;


  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String register(String name, String username, String password,
                         Model model, RedirectAttributes attributes) {

    UserRegisterRequest request = new UserRegisterRequest();
    request.setBindType(BindType.account);
    request.setNo(username);
    request.setPassword(password);
    UserBasicResponse userx = userInfoService.register(request);
    if (userx.getCode() == 0) {
      attributes.addAttribute("msg", "注册成功");
      return "redirect:/login.htm";
    } else {
      model.addAttribute("msg", userx.getMsg());
      return getView("register");
    }

  }

  /**
   * 跳转登录页
   *
   * @return
   */
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String view(Model model) {

    Subject subject = SecurityUtils.getSubject();
    if (subject.isAuthenticated()) {
      return "redirect:" + "/index.htm";
    } else {
      initurls(model);
      return getView(Views.LOGIN);
    }
  }



  @RequestMapping(value = "plugs/{plug}")
  public String oauthlogin(String code, @PathVariable String plug, HttpServletRequest request, HttpServletResponse response, Model model) {
    initurls(model);
    if (StringUtils.isEmpty(code)) {
      return getView(Views.LOGIN);
    }
    OauthResponse oauthResponse = oauthSiteService.handle(plug, code);
    if (oauthResponse == null) {
      return getView(Views.LOGIN);
    }
    UserOauthToken userOauthToken = tokenService.login(oauthResponse);
    UserInfo user = userOauthToken.getUser();
    String result = login(user);
    if (result != null) {
      return result;
    } else {
      return getView(Views.LOGIN);
    }

  }

  private String login(UserInfo user) {
    if (user != null) {
      Subject subject = SecurityUtils.getSubject();
      if (!subject.isAuthenticated()) {
        UserInfoToken token = new UserInfoToken(user.getId());
        token.setRememberMe(true);
        try {
          subject.login(token);
        } catch (Exception ex) {
          ex.printStackTrace();
        }
        if (subject.isAuthenticated()) {
          return "redirect:" + "/index.htm";
        } else {
          return getView("login");
        }
      }
    }
    return null;
  }

  private void initurls(Model model) {
    model.addAttribute("oauths", oauthSiteService.list());
  }

  @Autowired
  UserInfoService userService;


  /**
   * 跳转登录页
   *
   * @return
   */
  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public String register() {
    return getView("register");
  }

  /**
   * 跳转登录页
   *
   * @return
   */
  @RequestMapping(value = "/loginok", method = RequestMethod.GET)
  public String loginok() {

    UserInfo user = UserUtil.getCurrentUser();

    if (SecurityUtils.getSubject().isAuthenticated()) {
      if (SecurityUtils.getSubject().hasRole("管理员")) {
        return "/admin/home";
      } else {
        return "redirect:/member/index.htm";
      }
    } else {
      return getView("login");
    }

  }

  /**
   * 提交登录
   *
   * @return
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String login(RedirectAttributes attributes) {
    attributes.addFlashAttribute("msg", "密码错误");
    return "redirect:login.htm";
  }

}
