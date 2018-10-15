package com.quhaodian.ucms.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.sd4324530.fastweixin.api.entity.UserInfo;
import com.haoxuer.discover.user.data.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "admin")
public class AdminWebAction {


	@Autowired
	private UserInfoService userInfoService;


	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "admin/login";
	}
	
	@RequestMapping(value = "loginwork", method = RequestMethod.POST)
	public String loginwork(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return "redirect:/admin/index.htm";
	}
	

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		//model.addAttribute("users")
		return "admin/home";
	}
}
