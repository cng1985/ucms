package com.ada.iwan.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ada.iwan.controller.BaseController;


@Controller
@RequestMapping(value = "activity")
public class ActivityController extends BaseController{

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		return getView("activity/index");
	}
}
