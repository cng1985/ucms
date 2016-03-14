package com.ada.iwan.controller.user;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ada.iwan.controller.BaseController;

@Controller
@RequestMapping(value = "user")
public class UserController extends BaseController {

	@RequiresUser
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		return getView("user/index");
	}
}
