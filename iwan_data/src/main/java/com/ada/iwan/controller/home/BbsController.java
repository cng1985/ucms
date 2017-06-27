package com.ada.iwan.controller.home;

import com.ada.bbs.data.service.ForumService;
import com.ada.iwan.controller.BaseController;
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

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

        return getView("bbs/index");
    }

    @RequestMapping(value = "/forum/{id}", method = RequestMethod.GET)
    public String forum(Model model, @PathVariable("id") Long id) {
        model.addAttribute("model", id);
        return getView("bbs/forum");
    }
}
