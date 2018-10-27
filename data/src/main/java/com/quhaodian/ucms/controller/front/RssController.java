package com.quhaodian.ucms.controller.front;

import com.haoxuer.discover.article.data.entity.Article;
import com.haoxuer.discover.article.data.service.ArticleService;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.user.utils.ConverResourceUtils;
import com.haoxuer.discover.views.rss.RssViewer;
import com.quhaodian.ucms.data.convers.ArticleToItemConver;
import com.rometools.rome.feed.rss.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class RssController {

  @Autowired
  ArticleService articleService;


  @RequestMapping(value = "/rss", method = RequestMethod.GET)
  public ModelAndView getFeedInRss() {

    Pageable pager = new Pageable();
    pager.getOrders().add(Order.desc("id"));
    pager.setPageSize(20);
    List<Article> articles = articleService.page(pager).getContent();
    List<Item> items = ConverResourceUtils.coverCollect(articles, new ArticleToItemConver());
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setView(new RssViewer());
    modelAndView.addObject("items", items);
    modelAndView.addObject("title", "好学儿");
    modelAndView.addObject("description", "好学儿,一个给你学习的地方!");
    modelAndView.addObject("link", "https://www.haoxuer.com");

    return modelAndView;

  }
}
