package com.ada.iwan.controller.admin;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import com.ada.user.entity.UserInfo;
import com.ada.user.service.UserInfoService;

@Controller
public class UserInfoAction {
	private static final Logger log = LoggerFactory.getLogger(UserInfoAction.class);

	@RequestMapping("/admin/userinfo/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {

		if (pageable == null) {
			pageable = new Pageable();
		}
		if (pageable.getOrders() == null || pageable.getOrders().size() == 0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		Page<UserInfo> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "admin/userinfo/list";
	}

	@RequestMapping("/admin/userinfo/view_add")
	public String add(ModelMap model) {
		return "admin/userinfo/add";
	}

	@RequestMapping("/admin/userinfo/view_edit")
	public String edit(Pageable pageable, Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("page", pageable);
		return "admin/userinfo/edit";
	}

	@RequestMapping("/admin/userinfo/model_save")
	public String save(UserInfo bean, HttpServletRequest request, ModelMap model) {

		String view = "redirect:view_list.htm";
		try {
			bean = manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			view = "admin/userinfo/add";
		}
		return view;
	}

	@RequestMapping("/admin/userinfo/model_update")
	public String update(Pageable pageable, UserInfo bean, HttpServletRequest request, ModelMap model) {

		String view = "redirect:/admin/userinfo/view_list.htm?pageNumber=" + pageable.getPageNumber();
		try {
			bean = manager.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			model.addAttribute("model", bean);
			model.addAttribute("page", pageable);
			view = "admin/userinfo/edit";
		}
		return view;
	}

	@RequestMapping("/admin/userinfo/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {

		manager.deleteById(id);

		return "redirect:/admin/userinfo/view_list.htm?pageNumber=" + pageable.getPageNumber();
	}

	@RequestMapping("/admin/userinfo/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {

		manager.deleteByIds(ids);

		return "redirect:/admin/userinfo/view_list.htm?pageNumber=" + pageable.getPageNumber();
	}

	@Autowired
	private UserInfoService manager;
}