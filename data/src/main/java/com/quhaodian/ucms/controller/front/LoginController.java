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

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quhaodian.shiro.realm.UserInfoToken;
import com.quhaodian.user.data.entity.UserAccount;
import com.quhaodian.user.data.entity.UserInfo;
import com.quhaodian.user.data.service.UserAccountService;
import com.quhaodian.user.data.service.UserInfoService;
import com.quhaodian.user.data.vo.UserAccountVo;
import com.quhaodian.user.enums.AccountType;
import com.quhaodian.user.oauth.domain.UserQQ;
import com.quhaodian.web.controller.front.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quhaodian.shiro.filter.UsernamePasswordCaptchaToken;
import com.quhaodian.shiro.utils.UserUtil;
import com.github.scribejava.apis.GitHubApi;
import com.github.scribejava.apis.SinaWeiboApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.scribejava.apis.OschinaApi;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 登录页
 * 
 * @author langhsu
 */
@Controller
public class LoginController extends BaseController {

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


	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String email, String username, String password, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		UserAccount account=new UserAccount();
		account.setAccountType(AccountType.Account);
		account.setUsername(username);
		account.setPassword(password);
		UserAccountVo state = accountService.reg(account);
		if (state.getCode()== 0) {
			model.addAttribute("msg", "注册成功");
			return "redirect:/login.htm";
		} else {
			model.addAttribute("msg", "注册失败");
			return getView("register");

		}

	}

	final OAuth20Service github;
	final OAuth20Service oschina;
	final OAuth20Service weibo;

	public LoginController() {
		github = new ServiceBuilder().apiKey("66e9bc9545ab3bcec49b")
				.apiSecret("a273f21ef3088dc4487dc90474c26c62d3a7b35f")
				.callback("http://www.yichisancun.com/githublogin.htm").scope("user,public_repo")
				.build(GitHubApi.instance());

		oschina = new ServiceBuilder().apiKey("CTJlkYcnBaZCsi4GGgUk").apiSecret("TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF")
				.callback("http://www.yichisancun.com/oschinalogin.htm").responseType("code")
				.build(OschinaApi.instance());

		weibo = new ServiceBuilder().apiKey("2320531559").apiSecret("bc4440c86d5be467f954b8e221ef6553")
				.callback("http://www.yichisancun.com/weibologin.htm").build(SinaWeiboApi20.instance());
	}

	/**
	 * 跳转登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String view(Model model) {

		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()){
			return "redirect:" + "/index.htm";
		}else{
			initurls(model);
			return getView(Views.LOGIN);
		}
	}

	@RequestMapping(value = "qqlogin")
	public String qqlogin(HttpServletRequest request, HttpServletResponse response, Model model) {
		return getView("qqlogin");
	}

	@RequestMapping(value = "weibologin")
	public String weibologin(String code, HttpServletRequest request, HttpServletResponse response, Model model) {
		initurls(model);
		OAuth2AccessToken tokenx;
		try {
			tokenx = weibo.getAccessToken(code);
			//UserInfo user = weiboService.login(tokenx.getAccessToken());
			UserInfo user=null;
			String result = login(user);
			if (result != null) return result;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}

		return getView(Views.LOGIN);

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
		model.addAttribute("githuburl", github.getAuthorizationUrl());
		model.addAttribute("oschinaurl", oschina.getAuthorizationUrl());
		model.addAttribute("weibourl", weibo.getAuthorizationUrl());
	}

	@RequestMapping(value = "githublogin")
	public String githublogin(String code, HttpServletRequest request, HttpServletResponse response, Model model) {
		initurls(model);
		try {
			OAuth2AccessToken tokenx = github.getAccessToken(code);
			if (tokenx != null) {
				UserInfo user=null;
				String result = login(user);
				if (result != null) return result;
			}
		} catch (Exception e) {
		}
		// token.get

		return getView(Views.LOGIN);
	}

	@RequestMapping(value = "oschinalogin")
	public String oschinalogin(String code, HttpServletRequest request, HttpServletResponse response, Model model) {
		initurls(model);
		try {
			String redirect_uri = "http://www.yichisancun.com/oschinalogin.htm";
			String grant_type = "authorization_code";
			String client_secret = "TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF";
			String client_id = "CTJlkYcnBaZCsi4GGgUk";
			//UserInfo oschina = userOschinaService.login(client_id, client_secret, grant_type, redirect_uri, code);
			UserInfo oschina=null;
			if (oschina != null && oschina.getId() != null) {
				Subject subject = SecurityUtils.getSubject();
				if (!subject.isAuthenticated()) {
					String result = login(oschina);
					if (result != null) return result;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return getView(Views.LOGIN);
	}


	@Autowired
	UserInfoService userService;

	@RequestMapping(value = "qqlogin2")
	public String qqlogin2(String access_token, String openid, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		try {

			//UserQQ qq = qqService.login(access_token, openid, "101303927");
			UserQQ qq=null;
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
			if (user.getCatalog() == 1) {
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
		attributes.addFlashAttribute("msg","密码错误");
		return  "redirect:login.htm";
	}

}
