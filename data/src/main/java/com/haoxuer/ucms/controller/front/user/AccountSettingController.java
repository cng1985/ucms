package com.haoxuer.ucms.controller.front.user;

import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.web.controller.front.BaseController;
import com.haoxuer.ucms.data.entity.Member;
import com.haoxuer.ucms.data.service.MemberService;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/account/settings")
public class AccountSettingController extends BaseController {

  @Autowired
  MemberService memberService;

  @RequiresUser
  @RequestMapping(value = "/base", method = RequestMethod.GET)
  public String base() {
    return getView("account/settings/base");
  }


  @RequiresUser
  @RequestMapping(value = "/updateuser")
  public String updateuser(Model model, Member member) {
    if (member != null) {
      member.setId(UserUtil.getCurrentUser().getId());
      memberService.update(member);
      UserInfo user = UserUtil.getCurrentUser();
      user.setAvatar(member.getAvatar());
      user.setName(member.getName());
    }
    return "redirect:/account/settings/base.htm";
  }

  @RequiresUser
  @RequestMapping(value = "/security", method = RequestMethod.GET)
  public String security() {
    return getView("account/settings/security");
  }

  @RequiresUser
  @RequestMapping(value = "/binding", method = RequestMethod.GET)
  public String binding() {
    return getView("account/settings/binding");
  }

  @RequiresUser
  @RequestMapping(value = "/notification", method = RequestMethod.GET)
  public String notification() {
    return getView("account/settings/notification");
  }
}
