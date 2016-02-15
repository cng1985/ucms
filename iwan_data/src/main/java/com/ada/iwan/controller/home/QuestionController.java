package com.ada.iwan.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.iwan.controller.BaseController;
import com.ada.question.entity.Question;
import com.ada.question.page.QuestionPage;
import com.ada.question.service.QuestionCatalogService;
import com.ada.question.service.QuestionService;


@Controller
@RequestMapping(value = "question")
public class QuestionController extends BaseController {

	@Autowired
	QuestionCatalogService catalogService;
	
	
	@Autowired
	QuestionService questionService;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index( @RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
			@RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize,Model model) {
		
		QuestionPage page =questionService.getPage(curpage, pagesize);
		model.addAttribute("catalogs", catalogService.findChild(1));
		model.addAttribute("questions", page.getList());

		
		return getView("question/index");
	}
	
	
	@RequestMapping(value = "/catalog", method = RequestMethod.GET)
	public String catalog(Integer id, @RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
			@RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize, Model model) {
		QuestionPage page = questionService.pageByCatalog(id, curpage, pagesize);

		model.addAttribute("questions", page.getList());
		model.addAttribute("catalogs", catalogService.findChild(1));
		model.addAttribute("page", page);
		model.addAttribute("id", id);
		model.addAttribute("curpage", curpage);
		model.addAttribute("pagesize", pagesize);

		return getView("question/catalog");
	}
	
	
	@RequestMapping(value = "/view_add", method = RequestMethod.GET)
	public String view_add( Model model) {
		
		model.addAttribute("catalogs", catalogService.findChild(1));
		return getView("question/view_add");
	}
	
	@RequestMapping(value = "/model_add", method = RequestMethod.GET)
	public String model_add( Model model,Question question) {
		
		questionService.save(question);
		
		return getView("question/model_add");
	}
	
}
