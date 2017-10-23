package com.ada.ucms.controller.admin;

import javax.servlet.http.HttpServletRequest;

import com.ada.user.data.entity.UserInfo;
import com.ada.user.data.service.UserInfoService;
import com.ada.user.data.service.UserRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;

@Controller
public class AdminAction {
	private static final Logger log = LoggerFactory.getLogger(AdminAction.class);

	@Autowired
	UserRoleService roleService;

	@RequestMapping("/admin/admin/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {

		if (pageable == null) {
			pageable = new Pageable();
		}
		if (pageable.getOrders() == null || pageable.getOrders().size() == 0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		pageable.getFilters().add(Filter.eq("catalog", 1));
		Page<UserInfo> pagination = manager.page(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "admin/admin/list";
	}

	@RequestMapping("/admin/admin/view_add")
	public String add(ModelMap model) {
		model.addAttribute("roles", roleService.list(0, 1000, null, null));
		return "admin/admin/add";
	}

	@RequestMapping("/admin/admin/view_edit")
	public String edit(Pageable pageable, Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("roles", roleService.list(0, 1000, null, null));
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("page", pageable);
		return "admin/admin/edit";
	}


	@RequestMapping("/admin/admin/model_update")
	public String update(Pageable pageable, UserInfo bean, HttpServletRequest request, ModelMap model) {

		String view = "redirect:/admin/admin/view_list.htm?pageNumber=" + pageable.getPageNumber();
		try {
			//bean.setPlainPassword(bean.getPassword());
			bean.setRoles(null);
			bean = manager.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			model.addAttribute("model", bean);
			model.addAttribute("page", pageable);
			view = "admin/admin/edit";
		}
		return view;
	}

	@RequestMapping("/admin/admin/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {

		manager.deleteById(id);

		return "redirect:/admin/admin/view_list.htm?pageNumber=" + pageable.getPageNumber();
	}

	@RequestMapping("/admin/admin/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {

		manager.deleteByIds(ids);

		return "redirect:/admin/admin/view_list.htm?pageNumber=" + pageable.getPageNumber();
	}

	@Autowired
	private UserInfoService manager;
}