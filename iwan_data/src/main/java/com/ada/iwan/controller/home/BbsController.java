package com.ada.iwan.controller.home;

import com.ada.bbs.data.entity.ForumPost;
import com.ada.bbs.data.entity.ForumPostLike;
import com.ada.bbs.data.service.ForumPostService;
import com.ada.bbs.data.service.ForumService;
import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.iwan.controller.BaseController;
import com.ada.shiro.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by cng19 on 2017/6/22.
 */

@Scope("prototype")
@Controller
@RequestMapping(value = "bbs")
public class BbsController extends BaseController {

    @Autowired
    ForumService forumService;

    @Autowired
    ForumPostService postService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

        return getView("bbs/index");
    }

    @RequestMapping(value = "/forum/{id}", method = RequestMethod.GET)
    public String forum(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("model", id);
        return getView("bbs/forum");
    }

    @RequestMapping(value = "/threads/{id}")
    public String threads(Model model, Pageable pageable, @PathVariable("id") Integer id) {

        pageable.getFilters().add(Filter.eq("forum.id",id));
        pageable.getOrders().add(Order.desc("id"));
        Page<ForumPost> page = postService.page(pageable);
        model.addAttribute("model", forumService.findById(id));
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page);
        model.addAttribute("id", id);

        return getView("bbs/threads");
    }

    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
    public String post(Model model, @PathVariable("id") Long id) {
        model.addAttribute("model", postService.findById(id));
        return getView("bbs/post");
    }

    @RequestMapping(value = "/writePost")
    public String writePost(Model model,Integer forum) {
        model.addAttribute("forum",forum);
        return getView("bbs/writePost");
    }

    @RequestMapping(value = "/postAdd")
    public String postAdd( ForumPost post) {
        post.setUser(UserUtil.getCurrentUser());
        postService.save(post);
        return redirect("/bbs/threads/"+post.getForum().getId()+".htm");
    }

}
