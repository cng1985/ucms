package com.ada.iwan.controller.admin;

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
import com.ada.shiro.utils.UserUtil;
import com.ada.article.entity.Article;
import com.ada.article.entity.ArticleCatalog;
import com.ada.article.service.ArticleCatalogService;
import com.ada.article.service.ArticleService;

@Controller
public class ArticleAction {
	private static final Logger log = LoggerFactory.getLogger(ArticleAction.class);
	@Autowired
	ArticleCatalogService articleCatalogService;

	@RequestMapping("/admin/article/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {

		if (pageable == null) {
			pageable = new Pageable();
		}
		if (pageable.getOrders() == null || pageable.getOrders().size() == 0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		Page<Article> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "/admin/article/list";
	}

	@RequestMapping("/admin/article/view_add")
	public String add(ModelMap model) {
		
		List<ArticleCatalog> cs = articleCatalogService.findChild(1);
		model.addAttribute("list", cs);
		
		return "/admin/article/add";
	}

	@RequestMapping("/admin/article/view_edit")
	public String edit(Pageable pageable, Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		List<ArticleCatalog> cs = articleCatalogService.findChild(1);
		model.addAttribute("list", cs);
		
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("page", pageable);
		return "/admin/article/edit";
	}

	@RequestMapping("/admin/article/view_view")
	public String view(Long id, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		return "/admin/article/view";
	}

	@RequestMapping("/admin/article/model_save")
	public String save(Article bean, String tag,HttpServletRequest request, ModelMap model) {

		String view = "redirect:view_list.htm";
		try {
			bean.setUser(UserUtil.getCurrentUser());
			if (tag != null) {
				manager.save(bean,tag.split(","));
			}else{
				manager.save(bean);

			}
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			view = "/admin/article/add";
		}
		return view;
	}

	@RequestMapping("/admin/article/model_update")
	public String update(Pageable pageable, Article bean, HttpServletRequest request, ModelMap model) {

		String view = "redirect:/admin/article/view_list.htm?pageNumber=" + pageable.getPageNumber();
		try {
			bean = manager.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			model.addAttribute("model", bean);
			model.addAttribute("page", pageable);
			view = "/admin/article/edit";
		}
		return view;
	}

	@RequestMapping("/admin/article/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {

		try {
			manager.deleteById(id);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}

		return list(pageable, request, model);
	}

	@RequestMapping("/admin/article/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {

		try {
			manager.deleteByIds(ids);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}
		return list(pageable, request, model);
	}

	@Autowired
	private ArticleService manager;
}