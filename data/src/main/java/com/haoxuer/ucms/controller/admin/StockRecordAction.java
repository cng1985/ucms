package com.haoxuer.ucms.controller.admin;



import javax.servlet.http.HttpServletRequest;

import com.haoxuer.ucms.data.entity.StockRecord;
import com.haoxuer.ucms.data.service.StockRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;

@Controller
public class StockRecordAction {
	private static final Logger log = LoggerFactory.getLogger(StockRecordAction.class);

	@RequestMapping("/admin/stockrecord/view_list")
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
	
		if (pageable==null) {
			pageable=new Pageable();
		}
		if (pageable.getOrders()==null||pageable.getOrders().size()==0) {
			pageable.getOrders().add(Order.desc("id"));
		}
		Page<StockRecord> pagination = manager.findPage(pageable);
		model.addAttribute("list", pagination.getContent());
		model.addAttribute("page", pagination);
		return "admin/stockrecord/list";
	}

	@RequestMapping("/admin/stockrecord/view_add")
	public String add(ModelMap model) {
		return "admin/stockrecord/add";
	}

	@RequestMapping("/admin/stockrecord/view_edit")
	public String edit(Long id, Integer pageNo, HttpServletRequest request, ModelMap model) {
		model.addAttribute("model", manager.findById(id));
		model.addAttribute("pageNo", pageNo);
		return "admin/stockrecord/edit";
	}

	@RequestMapping("/admin/stockrecord/model_save")
	public String save(StockRecord bean, HttpServletRequest request, ModelMap model) {
		bean = manager.save(bean);
		log.info("save Teacher id={}", bean.getId());
		return "redirect:view_list.htm";
	}

	@RequestMapping("/admin/stockrecord/model_update")
	public String update(Pageable pageable, StockRecord bean,HttpServletRequest request, ModelMap model) {
		bean = manager.update(bean);
		log.info("update Teacher id={}.", bean.getId());
		return list(pageable, request, model);
	}

	@RequestMapping("/admin/stockrecord/model_delete")
	public String delete(Pageable pageable, Long id, HttpServletRequest request, ModelMap model) {
			 
				manager.deleteById(id);
			 
		return list(pageable, request, model);
	}
	@RequestMapping("/admin/stockrecord/model_deletes")
	public String deletes(Pageable pageable, Long[] ids, HttpServletRequest request, ModelMap model) {
			 
				manager.deleteByIds(ids);
			 
		return list(pageable, request, model);
	}
	@Autowired
	private StockRecordService manager;
}