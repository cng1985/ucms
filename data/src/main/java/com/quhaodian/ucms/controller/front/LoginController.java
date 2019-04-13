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
import com.haoxuer.discover.user.data.response.UserLoginAuthResponse;
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
import sdk.GeetestConfig;
import sdk.GeetestLib;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

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
  public String register(HttpServletRequest request,String name, String username, String password,
                         Model model, RedirectAttributes attributes) {
    VerifyVo result = new VerifyVo();
    GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
      GeetestConfig.isnewfailback());

    String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
    String validate = request.getParameter(GeetestLib.fn_geetest_validate);
    String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

    //从session中获取gt-server状态
    int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

    //从session中获取userid
    String userid = (String) request.getSession().getAttribute("userid");

    //自定义参数,可选择添加
    HashMap<String, String> param = new HashMap<String, String>();
    param.put("user_id", userid); //网站用户id
    param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
    param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP

    int gtResult = 0;

    if (gt_server_status_code == 1) {
      //gt-server正常，向gt-server进行二次验证

      gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
      System.out.println(gtResult);
    } else {
      // gt-server非正常情况下，进行failback模式验证

      System.out.println("failback:use your own server captcha validate");
      gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
      System.out.println(gtResult);
    }


    if (gtResult == 1) {
      // 验证成功
      result.setStatus("success");
      result.setVersion(gtSdk.getVersionInfo());

      UserRegisterRequest registerRequest = new UserRegisterRequest();
      registerRequest.setBindType(BindType.account);
      registerRequest.setNo(username);
      registerRequest.setPassword(password);
      UserBasicResponse userx = userInfoService.register(registerRequest);
      if (userx.getCode() == 0) {
        attributes.addAttribute("msg", "注册成功");
        return "redirect:/login.htm";
      } else {
        model.addAttribute("msg", userx.getMsg());
        return getView("register");
      }
    } else {
      result.setStatus("fail");
      result.setVersion(gtSdk.getVersionInfo());
      attributes.addAttribute("msg", "非法操作");
      // 验证失败
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
  public String oauthLogin(String code, @PathVariable String plug, HttpServletRequest request, HttpServletResponse response, Model model) {
    String  result="/login.htm";
    initurls(model);
    if (StringUtils.isEmpty(code)) {
      return redirect(result);
    }
    OauthResponse oauthResponse = oauthSiteService.handle(plug, code);
    if (oauthResponse == null) {
      return redirect(result);
    }
    UserLoginAuthResponse userOauthToken = tokenService.loginAuth(oauthResponse);
    if (userOauthToken.getCode() == 0) {
      if (SecurityUtils.getSubject().isAuthenticated()) {
        //已经登陆过绑定第三方信息,如果第三方登陆没有绑定用户，绑定当前用户
        if (userOauthToken.getUser() == null) {
          tokenService.bind(userOauthToken.getId(), UserUtil.getCurrentUser().getId());
          redirect("/index.htm");
        }

      } else {
        if (userOauthToken.getUser() != null) {
          //已经绑定过用户信息
          UserInfo user = UserInfo.fromId(userOauthToken.getUser());
          return login(user);
        } else {
          //第一次第三方登陆
          UserInfo user = new UserInfo();
          user.setAvatar(oauthResponse.getAvatar());
          user.setName(oauthResponse.getName());
          userService.save(user);
          tokenService.bind(userOauthToken.getId(), user.getId());
          return login(user);
        }
      }


    }
    return redirect(result);

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
    return getView("login");
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
