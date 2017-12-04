package com.quhaodian.ucms.controller.front.home;

import com.quhaodian.article.data.entity.Article;
import com.quhaodian.article.data.entity.ArticleComment;
import com.quhaodian.article.data.request.ArticleLikeRequest;
import com.quhaodian.article.data.service.ArticleCatalogService;
import com.quhaodian.article.data.service.ArticleCommentService;
import com.quhaodian.article.data.service.ArticleService;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.discover.rest.base.ResponseObject;
import com.quhaodian.shiro.utils.UserUtil;
import com.quhaodian.user.utils.ListUtils;
import com.quhaodian.web.controller.front.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "article")
public class ArticleController extends BaseController {

    @Autowired
    ArticleService articleService;

    @Autowired
    ArticleCommentService articleCommentService;

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable("id") Long id, Model model, Pageable pageable) {

        Article article = articleService.findById(id);
        if (article == null) {
            return redirect("/article/index.htm");
        }

        model.addAttribute("article", articleService.findById(id));
        model.addAttribute("catalogs", articleCatalogService.list(0, 1000, ListUtils.list(Filter.eq("parent.id", 1)), null));
        pageable.getFilters().add(Filter.eq("article.id", id));
        pageable.getOrders().add(Order.desc("id"));
        model.addAttribute("pageData", articleCommentService.page(pageable));
        return getView("article/view");
    }

    @Autowired
    ArticleCatalogService articleCatalogService;

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(value = "/like")
    public ResponseObject like(Long id) {
        ResponseObject result = new ResponseObject();
        ArticleLikeRequest request=new ArticleLikeRequest();
        request.setArticle(id);
        request.setUser(UserUtil.getCurrentUser().getId());
        articleService.like(request);
        return result;
    }

    @RequestMapping(value = "/comment")
    public String comment(ArticleComment bean) {
        if (bean.getArticle() == null || StringUtils.isEmpty(bean.getContents())) {
            return redirect("/article/view/" + bean.getArticle().getId() + ".htm");
        }
        bean.setUser(UserUtil.getCurrentUser());
        articleService.comment(bean);

        return redirect("/article/view/" + bean.getArticle().getId() + ".htm");
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model,Pageable pager) {


        pager.getOrders().add(Order.desc("id"));
        Page<Article> page = articleService.page(pager);

        model.addAttribute("pageData", page);
        model.addAttribute("articles", page.getContent());
        model.addAttribute("catalogs", articleCatalogService.list(0, 1000, ListUtils.list(Filter.eq("parent.id", 1)), null));
        return getView("article/index");
    }


    @RequestMapping(value = "/catalog", method = RequestMethod.GET)
    public String catalog(@RequestParam(value = "id", required = true, defaultValue = "1") int id,  Pageable pager, Model model) {

        pager.getFilters().add(Filter.eq("catalog.id", id));
        pager.getOrders().add(Order.desc("id"));
        Page<Article> page = articleService.page(pager);
        model.addAttribute("articles", page.getContent());
        model.addAttribute("catalogs", articleCatalogService.list(0, 1000, ListUtils.list(Filter.eq("parent.id", 1)), null));
        model.addAttribute("pageData", page);
        model.addAttribute("id", id);
        return getView("article/catalog");
    }
}
