package com.ada.iwan.controller.admin;



import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import  com.ada.user.entity.UserOauthWeibo;
import com.ada.user.service.UserOauthWeiboService;

@Controller
@RequestMapping(value = "admin")
public class UserOauthWeiboAction {
	private static final Logger log = LoggerFactory.getLogger(UserOauthWeiboAction.class);

	@RequestMapping("/useroauthweibo/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
	
		if (pageable==null) {
			pageable=new Pageable();
		}
		if (pageable.getOrders()==null||pageable.getOrders().size()==0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		Page<UserOauthWeibo> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "/admin/useroauthweibo/list";
	}

	@RequestMapping("/useroauthweibo/view_add")
	public String add(ModelMap model) {
		return "/admin/useroauthweibo/add";
	}

	@RequestMapping("/useroauthweibo/view_edit")
	public String edit(Pageable pageable,Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("page", pageable);
		return "/admin/useroauthweibo/edit";
	}

	@RequestMapping("/useroauthweibo/model_save")
	public String save(UserOauthWeibo bean, HttpServletRequest request, ModelMap model) {
	
	    String view="redirect:view_list.htm";
		try {
			bean = manager.save(bean);
			log.info("save object id={}", bean.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			view="/admin/useroauthweibo/add";
		}
		return view;
	}

	@RequestMapping("/useroauthweibo/model_update")
	public String update(Pageable pageable, UserOauthWeibo bean,HttpServletRequest request, ModelMap model) {
		
		String view="redirect:/useroauthweibo/view_list.htm?pageNumber="+pageable.getPageNumber();
		try {
		bean = manager.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("erro", e.getMessage());
			model.addAttribute("model",bean);
		    model.addAttribute("page", pageable);
			view="/admin/useroauthweibo/edit";
		}
		return view;
	}

	@RequestMapping("/useroauthweibo/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {
			 
				manager.deleteById(id);
			 
		return "redirect:/useroauthweibo/view_list.htm?pageNumber="+pageable.getPageNumber();
	}
	@RequestMapping("/useroauthweibo/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {
			 
				manager.deleteByIds(ids);
			 
		return "redirect:/useroauthweibo/view_list.htm?pageNumber="+pageable.getPageNumber();
	}
	@Autowired
	private UserOauthWeiboService manager;
}