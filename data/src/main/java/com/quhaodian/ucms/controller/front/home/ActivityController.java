package com.quhaodian.ucms.controller.front.home;

import com.quhaodian.activity.data.entity.Activity;
import com.quhaodian.activity.data.entity.ActivityCatalog;
import com.quhaodian.activity.data.service.ActivityCatalogService;
import com.quhaodian.activity.data.service.ActivityService;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.controller.Constants;
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
		model.addAttribute("model", activityService.findById(id));
		initCatalog(model);
		return getView("activity/view");
	}

	private void initCatalog(Model model) {
		model.addAttribute("catalogs", articleCatalogService.list(0,1000, ListUtils.list(Filter.eq("parent.id",1)),null));
	}

	@Autowired
	ActivityCatalogService articleCatalogService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model,Pageable pager) {
		model.addAttribute(Constants.PAGE_DATA, activityService.page(pager));
		initCatalog(model);
		return getView("activity/index");
	}

	@RequestMapping(value = "/catalog", method = RequestMethod.GET)
	public String catalog(@RequestParam(value = "id", required = true, defaultValue = "1") int id,Pageable pager,Model model) {
		ActivityCatalog catalog = articleCatalogService.findById(id);
		if (catalog==null){
			return redirect("/activity/index.htm");
		}
		pager.getFilters().add(Filter.ge("catalog.lft", catalog.getLft()));
		pager.getFilters().add(Filter.le("catalog.rgt", catalog.getRgt()));		Page<Activity> page = activityService.page(pager);
		initCatalog(model);
		model.addAttribute(Constants.PAGE_DATA, page);
		model.addAttribute("id", id);
		return getView("activity/catalog");
	}
}
