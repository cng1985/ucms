package com.ada.iwan.controller.admin;

import com.ada.article.service.ArticleCatalogService;
import com.ada.data.utils.FilterUtils;
import javax.servlet.http.HttpServletRequest;

import com.ada.iwan.data.so.ArticleSo;
import com.ada.shiro.utils.UserUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import  com.ada.article.entity.Article;
import com.ada.article.service.ArticleService;

/**
* Created by imake on 2017年05月30日17:17:02.
*/
@Controller
public class ArticleAction {

	public static final String MODEL = "model";

	private static final Logger log = LoggerFactory.getLogger(ArticleAction.class);

	@Autowired
	private ArticleService manager;

	@Autowired
	private ArticleCatalogService catalogService;

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/view_list")
	public String list(Pageable pageable, ArticleSo so, HttpServletRequest request, ModelMap model) {
	
		if (pageable!=null) {
			if (pageable.getOrders()==null||pageable.getOrders().isEmpty()) {
			pageable.getOrders().add(Order.desc("id"));
			}
		}
		pageable.getFilters().addAll(FilterUtils.getFilters(so));
		Page<Article> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		model.addAttribute("so", so);
		return "/admin/article/list";
	}

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/view_add")
	public String add(ModelMap model) {
		model.addAttribute("catalogs",catalogService.findChilds(1));
		return "/admin/article/add";
	}

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/view_edit")
	public String edit(Pageable pageable,Long id, HttpServletRequest request, ModelMap model) {
		model.addAttribute(MODEL, manager.findById(id));
		model.addAttribute("page", pageable);
		model.addAttribute("catalogs",catalogService.findChilds(1));
		return "/admin/article/edit";
	}

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/view_view")
	public String view(Long id,HttpServletRequest request, ModelMap model) {
		model.addAttribute(MODEL, manager.findById(id));
		return "/admin/article/view";
	}

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/model_save")
	public String save(Article bean, HttpServletRequest request, ModelMap model) {
	
	    String view="redirect:view_list.htm";
		try {
			bean.setUser(UserUtil.getCurrentUser());
			manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			log.error("保存失败",e);
			model.addAttribute("erro", e.getMessage());
			view="/admin/article/add";
		}
		return view;
	}

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/model_update")
	public String update(Pageable pageable, Article bean,HttpServletRequest request, ModelMap model) {
		
		String view="redirect:/admin/article/view_list.htm?pageNumber="+pageable.getPageNumber();
		try {
			manager.update(bean);
		} catch (Exception e) {
			log.error("更新失败",e);
			model.addAttribute("erro", e.getMessage());
			model.addAttribute(MODEL,bean);
		    model.addAttribute("page", pageable);
			view="/admin/article/edit";
		}
		return view;
	}
	@RequiresPermissions("article")
	@RequestMapping("/admin/article/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {
			 
		try {
			manager.deleteById(id);
		} catch (DataIntegrityViolationException e) {
			log.error("删除失败",e);
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}
					 
		return list(pageable,new ArticleSo(), request, model);
	}

	@RequiresPermissions("article")
	@RequestMapping("/admin/article/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {
			 
	  try{
			manager.deleteByIds(ids);
		} catch (DataIntegrityViolationException e) {
			log.error("批量删除失败",e);
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}
		return list(pageable,new ArticleSo(), request, model);
	}

}