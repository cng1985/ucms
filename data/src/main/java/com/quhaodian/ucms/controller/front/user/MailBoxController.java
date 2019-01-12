package com.quhaodian.ucms.controller.front.user;


import com.haoxuer.discover.data.enums.StoreState;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.data.utils.FilterUtils;
import com.haoxuer.discover.notice.data.entity.UserNotification;
import com.haoxuer.discover.notice.data.entity.UserNotificationMember;
import com.haoxuer.discover.notice.data.service.UserNotificationMemberService;
import com.haoxuer.discover.notice.data.service.UserNotificationService;
import com.haoxuer.discover.notice.data.so.UserNotificationMemberSo;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.web.controller.front.BaseController;
import com.quhaodian.ucms.controller.Constants;
import com.quhaodian.ucms.utils.CheckUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "mailbox")
public class MailBoxController extends BaseController {

  @Autowired
  private UserNotificationMemberService manager;

  @Autowired
  private UserNotificationService userNotificationService;

  @RequiresUser
  @RequestMapping(value = "/compose", method = RequestMethod.GET)
  public String writeBlog() {
    return getView("mailbox/compose");
  }

  @RequiresUser
  @RequestMapping(value = "/readmail", method = RequestMethod.GET)
  public String readMail(Long id, ModelMap model) {
    UserNotificationMember notificationMember = manager.findById(id);
    if (notificationMember.getUser() == null) {
      return redirect("/mailbox/mailbox.htm");
    }
    if (CheckUtil.unCheck(notificationMember.getUser())) {
      return redirect("/mailbox/mailbox.htm");
    }
    model.addAttribute(Constants.MODEL, notificationMember);
    return getView("mailbox/readmail");
  }
  @RequiresUser
  @RequestMapping(value = "/view", method = RequestMethod.GET)
  public String view(Long id, ModelMap model) {
    UserNotification notificationMember = userNotificationService.findById(id);
    if (notificationMember.getAuthor() == null) {
      return redirect("/mailbox/sendlist.htm");
    }
    if (CheckUtil.unCheck(notificationMember.getAuthor())) {
      return redirect("/mailbox/sendlist.htm");
    }
    model.addAttribute(Constants.MODEL, notificationMember);
    return getView("mailbox/view");
  }
  @RequiresUser
  @RequestMapping(value = "/deletemail", method = RequestMethod.GET)
  public String deleteMail(Long id) {
    UserNotificationMember notificationMember = manager.findById(id);
    if (notificationMember.getUser() == null) {
      return redirect("/mailbox/mailbox.htm");
    }
    if (CheckUtil.unCheck(notificationMember.getUser())) {
      return redirect("/mailbox/mailbox.htm");
    }
    manager.deleteById(id);
    return redirect("/mailbox/mailbox.htm");
  }
  @RequiresUser
  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public String delete(Long id) {
    UserNotification notificationMember = userNotificationService.findById(id);
    if (notificationMember.getAuthor() == null) {
      return redirect("/mailbox/sendlist.htm");
    }
    if (CheckUtil.unCheck(notificationMember.getAuthor())) {
      return redirect("/mailbox/sendlist.htm");
    }
    userNotificationService.deleteById(id);
    return redirect("/mailbox/sendlist.htm");
  }
  @RequiresUser
  @RequestMapping(value = "/mailbox", method = RequestMethod.GET)
  public String mailbox(Pageable pageable, UserNotificationMemberSo so, ModelMap model) {

    if (pageable == null) {
      pageable = new Pageable();
    }
    if (pageable.getOrders().isEmpty()) {
      pageable.getOrders().add(Order.desc("id"));
    }
    userNotificationService.updateNoticesByNum(UserUtil.getCurrentShiroUser().getId());
    pageable.getFilters().addAll(FilterUtils.getFilters(so));
    pageable.getFilters().add(Filter.eq("user.id", UserUtil.getCurrentShiroUser().getId()));
    Page<UserNotificationMember> pagination = manager.page(pageable);
    model.addAttribute("list", pagination.getContent());
    model.addAttribute("page", pagination);
    model.addAttribute("so", so);

    return getView("mailbox/mailbox");
  }

  @RequestMapping("/sendlist")
  public String sendList(Pageable pageable, UserNotificationMemberSo so, ModelMap model) {

    if (pageable == null) {
      pageable = new Pageable();
    }
    if (pageable.getOrders().isEmpty()) {
      pageable.getOrders().add(Order.desc("id"));
    }
    pageable.getFilters().addAll(FilterUtils.getFilters(so));
    pageable.getFilters().add(Filter.eq("storeState",StoreState.normal));
    pageable.getFilters().add(Filter.eq("author.id", UserUtil.getCurrentShiroUser().getId()));
    Page<UserNotification> pagination = userNotificationService.page(pageable);
    model.addAttribute("list", pagination.getContent());
    model.addAttribute("page", pagination);
    model.addAttribute("so", so);
    return getView("mailbox/sendlist");
  }

  @RequiresUser
  @RequestMapping(value = "/sendmail")
  public String sendMail(ModelMap model, UserNotification notification, Long user) {
    notification.setStoreState(StoreState.normal);
    notification.setAuthor(UserUtil.getUser());
    userNotificationService.send(user, notification);
    return redirect("/mailbox/sendlist.htm");
  }


}
