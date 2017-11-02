package com.ada.ucms.controller.front;

import java.util.ArrayList;
import java.util.List;

import com.ada.article.data.entity.Article;
import com.ada.article.data.service.ArticleService;
import com.ada.data.page.Order;
import com.ada.data.page.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RssController {

    @Autowired
    ArticleService articleService;


    @RequestMapping(value = "/rssfeed", method = RequestMethod.GET)
    public ModelAndView getFeedInRss() {

        List<Article> items = new ArrayList<Article>();

        Pageable pager = new Pageable();
        pager.getOrders().add(Order.desc("id"));
        pager.setPageSize(20);
        items = articleService.page(pager).getContent();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("rssViewer");
        mav.addObject("feedContent", items);

        return mav;

    }
}
