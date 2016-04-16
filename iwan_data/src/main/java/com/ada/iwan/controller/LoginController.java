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
import com.ada.user.entity.UserInfo;
import com.ada.user.entity.UserQQ;
import com.ada.user.service.UserInfoService;
import com.ada.user.service.UserQQService;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.young.http.Connection;
import com.young.http.HttpConnection;

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

	/**
	 * 跳转登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String view() {
		return getView(Views.LOGIN);
	}

	@RequestMapping(value = "qqlogin")
	public String qqlogin(HttpServletRequest request, HttpServletResponse response, Model model) {
		return getView("qqlogin");
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
