package com.ada.iwan.controller.admin;



import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ada.data.page.Order;
import com.ada.data.page.Pageable;
import com.ada.question.entity.QuestionCatalog;
import com.ada.question.service.QuestionCatalogService;
@Controller
public class QuestionCatalogAction {
	private static final Logger log = LoggerFactory.getLogger(QuestionCatalogAction.class);

	@RequestMapping("/admin/questioncatalog/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
	
		if (pageable==null) {
			pageable=new Pageable();
		}
		if (pageable.getOrders()==null||pageable.getOrders().size()==0) {
			pageable.getOrders().add(Order.desc("id"));
		}
//		Page<QuestionCatalog> pagination = manager.findPage(pageable);
//		model.addAttribute("list", pagination.getContent());
//		model.addAttribute("page", pagination);
		return "admin/questioncatalog/list";
	}

	@RequestMapping("/admin/questioncatalog/view_add")
	public String add(ModelMap model) {
		return "admin/questioncatalog/add";
	}

	@RequestMapping("/admin/questioncatalog/view_edit")
	public String edit(Integer id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		return "admin/questioncatalog/edit";
	}

	@RequestMapping("/admin/questioncatalog/model_save")
	public String save(QuestionCatalog bean, HttpServletRequest request, ModelMap model) {
		bean = manager.save(bean);
		log.info("save Teacher id={}", bean.getId());
		return "redirect:view_list.htm";
	}

	@RequestMapping("/admin/questioncatalog/model_update")
	public String update(Pageable pageable, QuestionCatalog bean,HttpServletRequest request, ModelMap model) {
		bean = manager.update(bean);
		log.info("update Teacher id={}.", bean.getId());
		return list(pageable, request, model);
	}

	@RequestMapping("/admin/questioncatalog/model_delete")
	public String delete(Pageable pageable, Integer id, HttpServletRequest request, ModelMap model) {
			 
				manager.deleteById(id);
			 
		return list(pageable, request, model);
	}
	@RequestMapping("/admin/questioncatalog/model_deletes")
	public String deletes(Pageable pageable, Integer[] ids, HttpServletRequest request, ModelMap model) {
			 
				manager.deleteByIds(ids);
			 
		return list(pageable, request, model);
	}
	@Autowired
	private QuestionCatalogService manager;
}