package com.quhaodian.ucms.controller.admin;

import javax.servlet.http.HttpServletRequest;

import com.haoxuer.discover.user.shiro.utils.UserUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.quhaodian.ucms.data.entity.Note;
import com.quhaodian.ucms.data.service.NoteService;

@Controller
public class NoteAction {
	private static final Logger log = LoggerFactory.getLogger(NoteAction.class);

	@RequestMapping("/admin/note/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {

		if (pageable == null) {
			pageable = new Pageable();
		}
		if (pageable.getOrders() == null || pageable.getOrders().size() == 0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		pageable.getFilters().add(Filter.ne("state", 3));
		pageable.getFilters().add(Filter.eq("user.id", UserUtil.getCurrentUser().getId()));

		Page<Note> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "/admin/note/list";
	}

	@RequestMapping("/admin/note/view_add")
	public String add(ModelMap model) {
		return "/admin/note/add";
	}

	@RequestMapping("/admin/note/view_edit")
	public String edit(Pageable pageable, Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("page", pageable);
		return "/admin/note/edit";
	}

	@RequestMapping("/admin/note/view_view")
	public String view(Long id, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		return "/admin/note/view";
	}

	@RequestMapping("/admin/note/model_save")
	public String save(Note bean, HttpServletRequest request, ModelMap model) {

		String view = "redirect:view_list.htm";
		try {
			bean.setUser(UserUtil.getCurrentUser());
			bean = manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			view = "/admin/note/add";
		}
		return view;
	}

	@RequestMapping("/admin/note/model_update")
	public String update(Pageable pageable, Note bean, HttpServletRequest request, ModelMap model) {

		String view = "redirect:/admin/note/view_list.htm?pageNumber=" + pageable.getPageNumber();
		try {
			bean.setUser(null);
			bean = manager.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			model.addAttribute("model", bean);
			model.addAttribute("page", pageable);
			view = "/admin/note/edit";
		}
		return view;
	}

	@RequestMapping("/admin/note/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {

		try {
			manager.deleteById(id);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}

		return list(pageable, request, model);
	}

	@RequestMapping("/admin/note/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {

		try {
			manager.deleteByIds(ids);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
		}
		return list(pageable, request, model);
	}

	@Autowired
	private NoteService manager;
}