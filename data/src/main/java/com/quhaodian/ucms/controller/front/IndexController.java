package com.quhaodian.ucms.controller.front;

import com.quhaodian.article.data.entity.ArticleCatalog;
import com.quhaodian.article.data.service.ArticleCatalogService;
import com.quhaodian.article.data.service.ArticleService;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.user.utils.ListUtils;
import com.quhaodian.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
public class IndexController extends BaseController {

    @Autowired
    ArticleService articleService;


    @Autowired
    ArticleCatalogService articleCatalogService;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {


        Pageable pager = new Pageable();
        pager.getOrders().add(Order.desc("id"));
        model.addAttribute("articles", articleService.page(pager).getContent());
        List<ArticleCatalog> catalogs = articleCatalogService.list(0, 1000, ListUtils.list(Filter.eq("parent.id", 1)), null);
        model.addAttribute("catalogs", catalogs);
        return getView("index");
    }
}
