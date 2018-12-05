package com.quhaodian.ucms.controller.front.home;

import com.haoxuer.discover.article.data.entity.Article;
import com.haoxuer.discover.article.data.service.ArticleService;
import com.haoxuer.discover.bbs.data.entity.ForumPost;
import com.haoxuer.discover.bbs.data.service.ForumPostService;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.question.data.entity.Question;
import com.haoxuer.discover.question.data.service.QuestionService;
import com.haoxuer.discover.user.shiro.realm.ShiroUser;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.userfriend.data.entity.UserFollow;
import com.haoxuer.discover.userfriend.data.service.UserFollowService;
import com.quhaodian.ucms.controller.Constants;
import com.quhaodian.ucms.data.entity.Member;
import com.quhaodian.ucms.data.service.MemberService;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by cng19 on 2017/6/23.
 */

@Scope("prototype")
@Controller
@RequestMapping(value = "space")
public class SpaceController extends BaseController {

  @Autowired
  MemberService service;

  @Autowired
  UserFollowService followService;

  @Autowired
  ArticleService articleService;

  @Autowired
  ForumPostService postService;

  @Autowired
  QuestionService questionService;

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public String view(@PathVariable("id") Long id, Model model) {
    Member member = service.findById(id);
    if (member == null) {
      return redirect("/index.htm");
    } else {
      haveFollow(id, model);
      model.addAttribute("model", member);
      return getView("space/view");
    }

  }

  private void haveFollow(@PathVariable("id") Long id, Model model) {
    boolean haveFollow = false;
    ShiroUser user = UserUtil.getCurrentShiroUser();
    if (user != null) {
      haveFollow = followService.haveFollow(user.getId(), id);
    }
    model.addAttribute("haveFollow", haveFollow);
  }

  @RequestMapping(value = "/fans/{id}", method = RequestMethod.GET)
  public String fans(@PathVariable("id") Long id, Model model, Pageable pager) {
    Member member = service.findById(id);
    if (member == null) {
      return redirect("/index.htm");
    } else {
      haveFollow(id, model);
      pager.getFilters().add(Filter.eq("follower.id", id));
      pager.getOrders().add(Order.desc("id"));
      pager.setPageSize(16);
      Page<UserFollow> page = followService.page(pager);
      model.addAttribute(Constants.PAGE_DATA, page);
      model.addAttribute("model", member);
      return getView("space/fans");
    }

  }

  @RequestMapping(value = "/follow/{id}", method = RequestMethod.GET)
  public String follow(@PathVariable("id") Long id, Model model, Pageable pager) {
    Member member = service.findById(id);
    if (member == null) {
      return redirect("/index.htm");
    } else {
      haveFollow(id, model);
      pager.getFilters().add(Filter.eq("user.id", id));
      pager.getOrders().add(Order.desc("id"));
      pager.setPageSize(16);
      Page<UserFollow> page = followService.page(pager);
      model.addAttribute(Constants.PAGE_DATA, page);
      model.addAttribute("model", member);
      return getView("space/follow");
    }

  }

  @RequestMapping(value = "/mypost/{id}", method = RequestMethod.GET)
  public String mypost(@PathVariable("id") Long id, Model model, Pageable pager) {
    Member member = service.findById(id);
    if (member == null) {
      return redirect("/index.htm");
    } else {
      haveFollow(id, model);
      pager.getFilters().add(Filter.ge("user.id", id));
      pager.getOrders().add(Order.desc("id"));
      Page<ForumPost> page = postService.page(pager);
      model.addAttribute(Constants.PAGE_DATA, page);
      model.addAttribute("model", member);
      return getView("space/mypost");
    }

  }

  @RequestMapping(value = "/myarticle/{id}", method = RequestMethod.GET)
  public String myArticle(@PathVariable("id") Long id, Model model, Pageable pager) {
    Member member = service.findById(id);
    if (member == null) {
      return redirect("/index.htm");
    } else {
      haveFollow(id, model);
      pager.getFilters().add(Filter.ge("user.id", id));
      pager.getOrders().add(Order.desc("id"));
      Page<Article> page = articleService.page(pager);
      model.addAttribute(Constants.PAGE_DATA, page);
      model.addAttribute("model", member);
      return getView("space/myarticle");
    }

  }


  @RequestMapping(value = "/myquestion/{id}", method = RequestMethod.GET)
  public String myQuestion(@PathVariable("id") Long id, Model model, Pageable pager) {
    Member member = service.findById(id);
    if (member == null) {
      return redirect("/index.htm");
    } else {
      haveFollow(id, model);
      pager.getFilters().add(Filter.ge("user.id", id));
      pager.getOrders().add(Order.desc("id"));
      Page<Question> page = questionService.page(pager);
      model.addAttribute(Constants.PAGE_DATA, page);
      model.addAttribute("model", member);
      return getView("space/myquestion");
    }

  }
}
