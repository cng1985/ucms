package com.ada.iwan.controller.user;

import com.ada.iwan.data.entity.Member;
import com.ada.iwan.data.service.MemberService;
import com.ada.user.entity.UserInfo;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ada.iwan.controller.BaseController;
import com.ada.shiro.utils.UserUtil;

@Controller
@RequestMapping(value = "member")
public class MemberController extends BaseController {
	@Autowired
	private MemberService memberService;


	@RequiresUser
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		UserInfo user=UserUtil.getCurrentUser();
		model.addAttribute("user", memberService.findById(user.getId()));
		return getView("member/index");
	}






	@RequiresUser
	@RequestMapping(value = "/updateuser")
	public String updateuser(Model model,Member member) {
		if (member !=null) {
			member.setId(UserUtil.getCurrentUser().getId());
			memberService.update(member);
			UserInfo user=UserUtil.getCurrentUser();
			user.setAvatar(member.getAvatar());
			user.setName(member.getName());
		}
		return "redirect:/member/index.htm";
	}
}
