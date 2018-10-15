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

import com.haoxuer.discover.user.shiro.filter.UsernamePasswordCaptchaToken;
import com.haoxuer.discover.user.shiro.realm.UserInfoToken;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.useroauth.plugs.service.OauthSiteService;
import com.haoxuer.discover.user.data.entity.UserAccount;
import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.user.data.entity.UserOauthToken;
import com.haoxuer.discover.user.data.service.UserAccountService;
import com.haoxuer.discover.user.data.service.UserInfoService;
import com.haoxuer.discover.user.data.service.UserOauthTokenService;
import com.haoxuer.discover.user.data.vo.UserAccountVo;
import com.haoxuer.discover.user.enums.AccountType;
import com.haoxuer.discover.user.oauth.domain.OauthResponse;
import com.haoxuer.discover.user.oauth.domain.UserQQ;
import com.haoxuer.discover.web.controller.front.BaseController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
  public String register(String email, String username, String password, HttpServletRequest request,
                         HttpServletResponse response, Model model) {
    
    UserAccount account = new UserAccount();
    account.setAccountType(AccountType.Account);
    account.setUsername(username);
    account.setPassword(password);
    UserAccountVo state = accountService.reg(account);
    if (state.getCode() == 0) {
      model.addAttribute("msg", "注册成功");
      return "redirect:/login.htm";
    } else {
      model.addAttribute("msg", "注册失败");
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
  
  @RequestMapping(value = "qqlogin")
  public String qqlogin(HttpServletRequest request, HttpServletResponse response, Model model) {
    return getView("qqlogin");
  }
  
  @RequestMapping(value = "plugs/{plug}")
  public String oauthlogin(String code, @PathVariable String plug, HttpServletRequest request, HttpServletResponse response, Model model) {
    initurls(model);
    if (StringUtils.isEmpty(code)){
      return getView(Views.LOGIN);
    }
    OauthResponse oauthResponse = oauthSiteService.handle(plug, code);
    if (oauthResponse==null){
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
  
  @RequestMapping(value = "qqlogin2")
  public String qqlogin2(String access_token, String openid, HttpServletRequest request, HttpServletResponse response,
                         Model model) {
    try {
      
      //UserQQ qq = qqService.login(access_token, openid, "101303927");
      UserQQ qq = null;
      if (qq != null) {
        Subject subject = SecurityUtils.getSubject();
        if (!subject.isAuthenticated()) {
          UsernamePasswordCaptchaToken token = new UsernamePasswordCaptchaToken();
          token.setUsername(openid);
          token.setPassword("123456".toCharArray());
          try {
            subject.login(token);
          } catch (Exception ex) {
            ex.printStackTrace();
          }
          if (subject.isAuthenticated()) {
            return "redirect:" + "/index.htm";
          } else {
            return "login";
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return getView("qqlogin");
  }
  
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
