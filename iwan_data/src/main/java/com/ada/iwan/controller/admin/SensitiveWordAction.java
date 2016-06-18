package com.ada.iwan.controller.admin;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import  com.ada.article.entity.SensitiveWord;
import com.ada.article.service.SensitiveCategoryService;
import com.ada.article.service.SensitiveWordService;

@Controller
public class SensitiveWordAction {
	private static final Logger log = LoggerFactory.getLogger(SensitiveWordAction.class);

	@Autowired
	private SensitiveCategoryService categoryService;
	
	@RequestMapping("/admin/sensitiveword/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
	
		if (pageable==null) {
			pageable=new Pageable();
		}
		if (pageable.getOrders()==null||pageable.getOrders().size()==0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		Page<SensitiveWord> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "/admin/sensitiveword/list";
	}

	@RequestMapping("/admin/sensitiveword/view_add")
	public String add(ModelMap model) {
		List<Order> orders=new ArrayList<Order>();
		orders.add(Order.asc("lft"));
		model.addAttribute("catalogs", categoryService.findList(0, 100, null, orders));
		return "/admin/sensitiveword/add";
	}

	@RequestMapping("/admin/sensitiveword/view_edit")
	public String edit(Pageable pageable,Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("page", pageable);
		
		List<Order> orders=new ArrayList<Order>();
		orders.add(Order.asc("lft"));
		model.addAttribute("catalogs", categoryService.findList(0, 100, null, orders));
		
		return "/admin/sensitiveword/edit";
	}

	@RequestMapping("/admin/sensitiveword/view_view")
	public String view(Long id,HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		return "/admin/sensitiveword/view";
	}

	@RequestMapping("/admin/sensitiveword/model_save")
	public String save(SensitiveWord bean, HttpServletRequest request, ModelMap model) {
	
	    String view="redirect:view_list.htm";
		try {
			bean = manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			view="/admin/sensitiveword/add";
		}
		return view;
	}

	@RequestMapping("/admin/sensitiveword/model_update")
	public String update(Pageable pageable, SensitiveWord bean,HttpServletRequest request, ModelMap model) {
		
		String view="redirect:/admin/sensitiveword/view_list.htm?pageNumber="+pageable.getPageNumber();
		try {
		bean = manager.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			model.addAttribute("model",bean);
		    model.addAttribute("page", pageable);
			view="/admin/sensitiveword/edit";
		}
		return view;
	}

	@RequestMapping("/admin/sensitiveword/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {
			 
		try {
			manager.deleteById(id);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}
					 
		return list(pageable, request, model);
	}
	@RequestMapping("/admin/sensitiveword/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {
			 
	  try{
			manager.deleteByIds(ids);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}
		return list(pageable, request, model);
	}
	@Autowired
	private SensitiveWordService manager;
}