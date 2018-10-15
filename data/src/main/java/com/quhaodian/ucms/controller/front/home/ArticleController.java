package com.quhaodian.ucms.controller.front.home;

import com.haoxuer.discover.article.data.entity.Article;
import com.haoxuer.discover.article.data.entity.ArticleCatalog;
import com.haoxuer.discover.article.data.entity.ArticleComment;
import com.haoxuer.discover.article.data.request.ArticleLikeRequest;
import com.haoxuer.discover.article.data.service.ArticleCatalogService;
import com.haoxuer.discover.article.data.service.ArticleCommentService;
import com.haoxuer.discover.article.data.service.ArticleService;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.rest.base.ResponseObject;
import com.haoxuer.discover.user.shiro.utils.UserUtil;
import com.quhaodian.ucms.controller.Constants;
import com.haoxuer.discover.user.utils.ListUtils;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        initCatalog(model);
        pageable.getFilters().add(Filter.eq("article.id", id));
        pageable.getOrders().add(Order.desc("id"));
        model.addAttribute(Constants.PAGE_DATA, articleCommentService.page(pageable));
        return getView("article/view");
    }

    private void initCatalog(Model model) {
        model.addAttribute("catalogs", articleCatalogService.list(0, 1000, ListUtils.list(Filter.eq("parent.id", 1)), null));
    }

    @Autowired
    ArticleCatalogService articleCatalogService;

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(value = "/like")
    public ResponseObject like(Long id) {
        ResponseObject result = new ResponseObject();
        ArticleLikeRequest request = new ArticleLikeRequest();
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
    public String index(Model model, Pageable pager) {


        pager.getOrders().add(Order.desc("id"));
        Page<Article> page = articleService.page(pager);

        model.addAttribute(Constants.PAGE_DATA, page);
        model.addAttribute("articles", page.getContent());
        initCatalog(model);
        return getView("article/index");
    }


    @RequestMapping(value = "/catalog", method = RequestMethod.GET)
    public String catalog(@RequestParam(value = "id", required = true, defaultValue = "1") int id, Pageable pager, Model model) {

        ArticleCatalog catalog = articleCatalogService.findById(id);
        if (catalog==null){
            return redirect("/article/index.htm");
        }
        pager.getFilters().add(Filter.ge("catalog.lft", catalog.getLft()));
        pager.getFilters().add(Filter.le("catalog.rgt", catalog.getRgt()));

        pager.getOrders().add(Order.desc("id"));
        Page<Article> page = articleService.page(pager);
        model.addAttribute("articles", page.getContent());
        initCatalog(model);
        model.addAttribute(Constants.PAGE_DATA, page);
        model.addAttribute("id", id);
        return getView("article/catalog");
    }
}
