package com.haoxuer.ucms.questions.controller.admin;

import com.haoxuer.discover.data.utils.FilterUtils;
import com.haoxuer.ucms.questions.data.so.QuestionVoteSo;
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
import  com.haoxuer.ucms.questions.data.entity.QuestionVote;
import com.haoxuer.ucms.questions.data.service.QuestionVoteService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.context.annotation.Scope;

/**
*
* Created by imake on 2019年09月23日11:38:26.
*/


@Scope("prototype")
@Controller
public class QuestionVoteAction {

	public static final String MODEL = "model";

	public static final String REDIRECT_LIST_HTML = "redirect:/admin/questionvote/view_list.htm";

	private static final Logger log = LoggerFactory.getLogger(QuestionVoteAction.class);

	@Autowired
	private QuestionVoteService manager;

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/view_list")
	public String list(Pageable pageable,QuestionVoteSo so,ModelMap model) {

		if (pageable==null){
			pageable=new Pageable();
		}
		if (pageable.getOrders().isEmpty()) {
			pageable.getOrders().add(Order.desc("id"));
		}
		pageable.getFilters().addAll(FilterUtils.getFilters(so));
		Page<QuestionVote> pagination = manager.page(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		model.addAttribute("so", so);
		return "/admin/questionvote/list";
	}

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/view_add")
	public String add(ModelMap model) {
		return "/admin/questionvote/add";
	}

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/view_edit")
	public String edit(Pageable pageable,Long id, ModelMap model) {
		model.addAttribute(MODEL, manager.findById(id));
		model.addAttribute("page", pageable);
		return "/admin/questionvote/edit";
	}

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/view_view")
	public String view(Long id,ModelMap model) {
		model.addAttribute(MODEL, manager.findById(id));
		return "/admin/questionvote/view";
	}

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/model_save")
	public String save(QuestionVote bean,ModelMap model) {
	
	    String view=REDIRECT_LIST_HTML;
		try {
			manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			log.error("保存失败",e);
			model.addAttribute("erro", e.getMessage());
			view="/admin/questionvote/add";
		}
		return view;
	}

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/model_update")
	public String update(Pageable pageable, QuestionVote bean, RedirectAttributes redirectAttributes, ModelMap model) {
		
		String view=REDIRECT_LIST_HTML;
		try {
			manager.update(bean);
			initRedirectData(pageable, redirectAttributes);
		} catch (Exception e) {
			log.error("更新失败",e);
			model.addAttribute("erro", e.getMessage());
			model.addAttribute(MODEL,bean);
		    model.addAttribute("page", pageable);
			view="/admin/questionvote/edit";
		}
		return view;
	}
	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/model_delete")
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

	@RequiresPermissions("questionvote")
	@RequestMapping("/admin/questionvote/model_deletes")
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