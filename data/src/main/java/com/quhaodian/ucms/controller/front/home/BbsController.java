package com.quhaodian.ucms.controller.front.home;

import com.haoxuer.discover.bbs.data.entity.ForumPost;
import com.haoxuer.discover.bbs.data.entity.ForumPostText;
import com.haoxuer.discover.bbs.data.service.ForumPostService;
import com.haoxuer.discover.bbs.data.service.ForumPostTextService;
import com.haoxuer.discover.bbs.data.service.ForumService;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.apache.shiro.authz.annotation.RequiresUser;
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

    @Autowired
    ForumPostTextService textService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

        Pageable likePageable=new Pageable();
        likePageable.getOrders().add(Order.desc("views"));
        likePageable.setPageSize(8);
        model.addAttribute("likes",postService.page(likePageable).getContent());
        Pageable newPageable=new Pageable();
        newPageable.getOrders().add(Order.desc("id"));
        newPageable.setPageSize(8);
        model.addAttribute("news",postService.page(newPageable).getContent());

        return getView("bbs/index");
    }

    @RequestMapping(value = "/forum/{id}", method = RequestMethod.GET)
    public String forum(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("model", forumService.findById(id));
        return getView("bbs/forum");
    }

    @RequestMapping(value = "/threads/{id}")
    public String threads(Model model, Pageable pageable, @PathVariable("id") Integer id) {

        pageable.getFilters().add(Filter.eq("forum.id", id));
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

    @RequiresUser
    @RequestMapping(value = "/writePost")
    public String writePost(Model model, Integer forum) {
        model.addAttribute("forum", forum);
        return getView("bbs/writePost");
    }

    @RequiresUser
    @RequestMapping(value = "/postAdd")
    public String postAdd(ForumPost post, String note) {
        post.setUser(UserUtil.getUser());
        postService.save(post);

        ForumPostText postText = new ForumPostText();
        postText.setPost(post);
        postText.setNote(note);
        textService.save(postText);

        return redirect("/bbs/threads/" + post.getForum().getId() + ".htm");
    }

}
