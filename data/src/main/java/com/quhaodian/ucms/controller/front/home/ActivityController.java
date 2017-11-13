package com.quhaodian.ucms.controller.front.home;

import com.quhaodian.activity.data.entity.Activity;
import com.quhaodian.activity.data.service.ActivityCatalogService;
import com.quhaodian.activity.data.service.ActivityService;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.user.utils.ListUtils;
import com.quhaodian.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "activity")
public class ActivityController extends BaseController {

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
