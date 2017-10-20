package com.ada.ucms.controller.home;

import com.ada.activity.data.entity.Activity;
import com.ada.activity.data.service.ActivityCatalogService;
import com.ada.activity.data.service.ActivityService;
import com.ada.data.page.Filter;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.user.utils.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.ucms.controller.BaseController;


@Controller
@RequestMapping(value = "activity")
public class ActivityController extends BaseController{

	@Autowired
	ActivityService activityService;

	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id")Long id, Model model) {
		model.addAttribute("activity", activityService.findById(id));
		model.addAttribute("catalogs", articleCatalogService.list(0,1000, ListUtils.list(Filter.eq("parent.id",1)),null));
		return getView("activity/view");
	}

	@Autowired
	ActivityCatalogService articleCatalogService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		Pageable pager=new Pageable();
		model.addAttribute("activitys", activityService.page(pager).getContent());
		model.addAttribute("catalogs", articleCatalogService.list(0,1000, ListUtils.list(Filter.eq("parent.id",1)),null));
		return getView("activity/index");
	}

	@RequestMapping(value = "/catalog", method = RequestMethod.GET)
	public String catalog(@RequestParam(value = "id", required = true, defaultValue = "1") int id,
			@RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
			@RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize, Model model) {
		Pageable pager=new Pageable();
		pager.setPageNumber(curpage);
		pager.setPageSize(pagesize);
		pager.getFilters().add(Filter.eq("catalog.id",id));
		Page<Activity> page = activityService.page(pager);
		model.addAttribute("activitys", page.getContent());
		model.addAttribute("catalogs", articleCatalogService.list(0,1000, ListUtils.list(Filter.eq("parent.id",1)),null));
		model.addAttribute("page", page);
		model.addAttribute("id", id);
		model.addAttribute("curpage", curpage);
		model.addAttribute("pagesize", pagesize);
		return getView("activity/catalog");
	}
}
