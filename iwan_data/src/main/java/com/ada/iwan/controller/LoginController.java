/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
 */
package com.ada.iwan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.ada.iwan.controller.home.Views;
import com.ada.shiro.filter.UsernamePasswordCaptchaToken;
import com.ada.user.entity.UserGitHub;
import com.ada.user.entity.UserInfo;
import com.ada.user.entity.UserOschina;
import com.ada.user.entity.UserQQ;
import com.ada.user.service.UserGitHubService;
import com.ada.user.service.UserInfoService;
import com.ada.user.service.UserOauthWeiboService;
import com.ada.user.service.UserOschinaService;
import com.ada.user.service.UserQQService;
import com.github.scribejava.apis.GitHubApi;
import com.github.scribejava.apis.OschinaApi;
import com.github.scribejava.apis.SinaWeiboApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;

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
	@RequestMapping("/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.htm";
	}

	@Autowired
	UserInfoService userInfoService;

	@Autowired
	UserOschinaService userOschinaService;

	@Autowired
	UserGitHubService userGitHubService;

	@Autowired
	UserOauthWeiboService weiboService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String email, String username, String password, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		int state = userInfoService.register(email, username, password);
		if (state > 0) {
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

		oschina = new ServiceBuilder().apiKey("CTJlkYcnBaZCsi4GGgUk").grantType("authorization_code")
				.apiSecret("TlKrmPCKImAKEzk1ORZtdwooJKDIgXrF").callback("http://www.yichisancun.com/oschinalogin.htm")
				.responseType("code").build(OschinaApi.instance());

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

		initurls(model);

		return getView(Views.LOGIN);
	}

	@RequestMapping(value = "qqlogin")
	public String qqlogin(HttpServletRequest request, HttpServletResponse response, Model model) {
		return getView("qqlogin");
	}

	@RequestMapping(value = "weibologin")
	public String weibologin(String code, HttpServletRequest request, HttpServletResponse response, Model model) {
		initurls(model);
		OAuth2AccessToken tokenx = weibo.getAccessToken(code);
		UserInfo user = weiboService.login(tokenx.getAccessToken());
		if (user != null) {
			Subject subject = SecurityUtils.getSubject();
			if (!subject.isAuthenticated()) {
				UsernamePasswordCaptchaToken token = new UsernamePasswordCaptchaToken();
				token.setUsername(user.getUsername());
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
		return getView(Views.LOGIN);

	}

	private void initurls(Model model) {
		model.addAttribute("githuburl", github.getAuthorizationUrl());
		model.addAttribute("oschinaurl", oschina.getAuthorizationUrl());
		model.addAttribute("weibourl", weibo.getAuthorizationUrl());
	}

	@RequestMapping(value = "githublogin")
	public String githublogin(String code, HttpServletRequest request, HttpServletResponse response, Model model) {
		initurls(model);
		OAuth2AccessToken tokenx = github.getAccessToken(code);
		try {
			UserGitHub oschina = userGitHubService.login(tokenx.getAccessToken());
			if (oschina != null) {
				Subject subject = SecurityUtils.getSubject();
				if (!subject.isAuthenticated()) {
					UsernamePasswordCaptchaToken token = new UsernamePasswordCaptchaToken();
					token.setUsername("github_" + oschina.getId());
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
			// TODO: handle exception
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
			UserInfo oschina = userOschinaService.login(client_id, client_secret, grant_type, redirect_uri, code);
			if (oschina != null&&oschina.getId()!=null) {
				Subject subject = SecurityUtils.getSubject();
				if (!subject.isAuthenticated()) {
					UsernamePasswordCaptchaToken token = new UsernamePasswordCaptchaToken();
					token.setUsername(oschina.getUsername());
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

		return getView(Views.LOGIN);
	}

	@Autowired
	UserQQService qqService;

	@Autowired
	UserInfoService userService;

	@RequestMapping(value = "qqlogin2")
	public String qqlogin2(String access_token, String openid, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		try {

			UserQQ qq = qqService.login(access_token, openid, "101303927");
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

		if (SecurityUtils.getSubject().hasRole("admin")) {
			return "admin/home";
		} else {
			if (SecurityUtils.getSubject().isAuthenticated()) {
				return "redirect:/user/index.htm";
			} else {
				return getView("login");
			}
		}

	}

	/**
	 * 提交登录
	 * 
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, ModelMap model) {
		String ret = getView(Views.LOGIN);

		if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
			return ret;
		}

		AuthenticationToken token = new UsernamePasswordToken(username, password);
		if (token == null) {
			model.put("message", "用户名或密码错误");
			return ret;
		}

		try {
			SecurityUtils.getSubject().login(token);

			ret = Views.REDIRECT_HOME;

			// 更新消息数量
			// pushBadgesCount();
		} catch (AuthenticationException e) {
			if (e instanceof UnknownAccountException) {
				model.put("message", "用户不存在");
			} else if (e instanceof LockedAccountException) {
				model.put("message", "用户被禁用");
			} else {
				model.put("message", "用户认证失败");
			}
		}

		return ret;
	}

	// private void pushBadgesCount() {
	// new Thread(() -> {
	//
	// try {
	// Thread.sleep(1 * Consts.TIME_MIN);
	// } catch (InterruptedException e) {
	// }
	//
	// AccountSubject subject = (AccountSubject) SecurityUtils.getSubject();
	//
	// BadgesCount count = new BadgesCount();
	// count.setNotifies(notifyService.unread4Me(subject.getProfile().getId()));
	// session.setAttribute("badgesCount", count);
	//
	// }).start();
	// }

}
