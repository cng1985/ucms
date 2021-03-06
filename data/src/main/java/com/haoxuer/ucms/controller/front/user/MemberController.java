package com.haoxuer.ucms.controller.front.user;

import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.userfriend.data.entity.UserFollow;
import com.haoxuer.discover.userfriend.data.service.UserFollowService;
import com.haoxuer.discover.user.data.entity.UserInfo;
import com.haoxuer.discover.web.controller.front.BaseController;
import com.haoxuer.ucms.member.data.entity.Member;
import com.haoxuer.ucms.member.data.service.MemberService;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "member")
public class MemberController extends BaseController {
  @Autowired
  private MemberService memberService;

  @Autowired
  private UserFollowService followService;


  @RequiresUser
  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public String index(Model model) {
    UserInfo user = UserUtil.getCurrentUser();
    model.addAttribute("user", memberService.findById(user.getId()));
    return getView("member/index");
  }

  @RequiresUser
  @RequestMapping(value = "/follow", method = RequestMethod.GET)
  public String follow(Long id, Model model) {
    Member member = memberService.findById(id);
    if (member==null){
      return redirect("/index.htm");
    }
    UserInfo user = UserUtil.getCurrentUser();
    UserFollow bean = new UserFollow();
    bean.setUser(user);
    bean.setFollower(UserInfo.fromId(id));
    followService.follow(bean);
    return redirect("/space/" + id + ".htm");
  }


}
