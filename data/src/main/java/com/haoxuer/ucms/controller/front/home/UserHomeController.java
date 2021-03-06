package com.haoxuer.ucms.controller.front.home;

import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.user.data.service.UserInfoService;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "userdetails")
public class UserHomeController extends BaseController {

	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping(value = "/view/{id}")
	public String index(@PathVariable("id") Long id, Model model) {

		UserInfo user = userInfoService.findById(id);
		model.addAttribute("user_detail", user);
		return getView("userdetails/view");
	}
}
