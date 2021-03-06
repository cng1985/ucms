package com.haoxuer.ucms.controller.admin;

import com.haoxuer.discover.data.utils.FilterUtils;
import com.haoxuer.ucms.data.entity.StockDay;
import com.haoxuer.ucms.data.service.StockDayService;
import com.haoxuer.ucms.data.so.StockDaySo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.context.annotation.Scope;

/**
*
* Created by imake on 2018年12月05日17:51:09.
*/


@Scope("prototype")
@Controller
public class StockDayAction {

	public static final String MODEL = "model";

	public static final String REDIRECT_LIST_HTML = "redirect:/admin/stockday/view_list.htm";

	private static final Logger log = LoggerFactory.getLogger(StockDayAction.class);

	@Autowired
	private StockDayService manager;

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/view_list")
	public String list(Pageable pageable, StockDaySo so, ModelMap model) {

		if (pageable==null){
			pageable=new Pageable();
		}
		if (pageable.getOrders().isEmpty()) {
			pageable.getOrders().add(Order.desc("id"));
		}
		pageable.getFilters().addAll(FilterUtils.getFilters(so));
		Page<StockDay> pagination = manager.page(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		model.addAttribute("so", so);
		return "/admin/stockday/list";
	}

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/view_add")
	public String add(ModelMap model) {
		return "/admin/stockday/add";
	}

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/view_edit")
	public String edit(Pageable pageable,Long id, ModelMap model) {
		model.addAttribute(MODEL, manager.findById(id));
		model.addAttribute("page", pageable);
		return "/admin/stockday/edit";
	}

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/view_view")
	public String view(Long id,ModelMap model) {
		model.addAttribute(MODEL, manager.findById(id));
		return "/admin/stockday/view";
	}

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/model_save")
	public String save(StockDay bean,ModelMap model) {
	
	    String view=REDIRECT_LIST_HTML;
		try {
			manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			log.error("保存失败",e);
			model.addAttribute("erro", e.getMessage());
			view="/admin/stockday/add";
		}
		return view;
	}

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/model_update")
	public String update(Pageable pageable, StockDay bean, RedirectAttributes redirectAttributes, ModelMap model) {
		
		String view=REDIRECT_LIST_HTML;
		try {
			manager.update(bean);
			initRedirectData(pageable, redirectAttributes);
		} catch (Exception e) {
			log.error("更新失败",e);
			model.addAttribute("erro", e.getMessage());
			model.addAttribute(MODEL,bean);
		    model.addAttribute("page", pageable);
			view="/admin/stockday/edit";
		}
		return view;
	}
	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/model_delete")
	public String delete(Pageable pageable, Long id, RedirectAttributes redirectAttributes) {

		String view=REDIRECT_LIST_HTML;

		try {
			initRedirectData(pageable, redirectAttributes);
			manager.deleteById(id);
		} catch (DataIntegrityViolationException e) {
			log.error("删除失败",e);
			redirectAttributes.addFlashAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}

		return view;
	}

	@RequiresPermissions("stockday")
	@RequestMapping("/admin/stockday/model_deletes")
	public String deletes(Pageable pageable, Long[] ids,RedirectAttributes redirectAttributes) {

		String view=REDIRECT_LIST_HTML;

		try{
				initRedirectData(pageable, redirectAttributes);
				manager.deleteByIds(ids);
			} catch (DataIntegrityViolationException e) {
				log.error("批量删除失败",e);
				redirectAttributes.addFlashAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
			}
		return view;
	}
	private void initRedirectData(Pageable pageable, RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("pageNumber",pageable.getPageNumber());
	}
}