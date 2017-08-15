package com.ada.iwan.controller.home;

import com.ada.data.page.Filter;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.question.data.entity.Question;
import com.ada.question.data.entity.QuestionCatalog;
import com.ada.question.data.service.QuestionCatalogService;
import com.ada.question.data.service.QuestionService;
import com.ada.user.utils.ListUtils;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.iwan.controller.BaseController;
import com.ada.shiro.utils.UserUtil;

import java.util.List;


@Controller
@RequestMapping(value = "question")
public class QuestionController extends BaseController {

    @Autowired
    QuestionCatalogService catalogService;


    @Autowired
    QuestionService questionService;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(@RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
                        @RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize, Model model) {

        Pageable pager = new Pageable();
        pager.setPageSize(pagesize);
        pager.setPageNumber(curpage);
        Page<Question> page = questionService.page(pager);

       model.addAttribute("catalogs", catalogs());
        model.addAttribute("questions", page.getContent());


        return getView("question/index");
    }

    private List<QuestionCatalog> catalogs() {
        return catalogService.list(0, 1000, ListUtils.list(Filter.eq("", 1)), null);
    }

    @RequestMapping(value = "/type/{catalog}", method = RequestMethod.GET)
    public String type(@PathVariable("catalog") String catalog, @RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
                       @RequestParam(value = "pagesize", required = true, defaultValue = "10") int pagesize, Model model) {
        if (catalog == null) {
            catalog = "new";
        }
        Page<Question> page = null;
        Pageable pager=new Pageable();
        pager.setPageNumber(curpage);
        pager.setPageSize(pagesize);
        if ("my".equals(catalog)) {
            pager.getFilters().add(Filter.eq("user.id", UserUtil.getCurrentUser().getId()));
            //pageByUser UserUtil.getCurrentUser().getId(), curpage, pagesize

        } else {
            //pageByType
            pager.getFilters().add(Filter.eq("catalog.id",catalog));
        }
        page = questionService.page(pager);

        model.addAttribute("catalogs", catalogs());
        model.addAttribute("questions", page.getContent());
        model.addAttribute("catalog", catalog);

        model.addAttribute("page", page);
        model.addAttribute("curpage", curpage);
        model.addAttribute("pagesize", pagesize);
        return getView("question/index");
    }

    @RequestMapping(value = "/catalog", method = RequestMethod.GET)
    public String catalog(Integer id, @RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
                          @RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize, Model model) {

        Pageable pager=new Pageable();
        pager.setPageNumber(curpage);
        pager.setPageSize(pagesize);

        Page<Question> page = null;
        page = questionService.page(pager);
        model.addAttribute("catalog", catalogService.findById(id));
        model.addAttribute("questions", page.getContent());
        model.addAttribute("catalogs", catalogs());
        model.addAttribute("page", page);
        model.addAttribute("id", id);
        model.addAttribute("curpage", curpage);
        model.addAttribute("pagesize", pagesize);

        return getView("question/catalog");
    }

    @RequiresUser
    @RequestMapping(value = "/ask")
    public String ask(Model model) {

        model.addAttribute("catalogs", catalogs());
        return getView("question/ask");
    }


    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable("id") Long id, Model model) {
        model.addAttribute("question", questionService.findById(id));
        model.addAttribute("catalogs", catalogs());
        return getView("question/view_view");
    }

    @RequiresUser
    @RequestMapping(value = "/model_add")
    public String model_add(Model model, Question question) {
        question.setUser(UserUtil.getCurrentUser());
        question.setState(0);
        question.setViews(0);
        questionService.save(question);

        return redirect("/question/view/" + question.getId() + ".htm");
    }

}
