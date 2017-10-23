package com.ada.ucms.controller.home;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.ucms.controller.BaseController;
import com.ada.ucms.data.entity.Stock;
import com.ada.ucms.data.entity.StockDetail;
import com.ada.ucms.data.service.StockDetailService;
import com.ada.ucms.data.service.StockService;
import com.ada.ucms.service.stock.api.StockApi;
import com.ada.ucms.service.stock.api.impl.StockListApiImpl;
import com.ada.ucms.service.stock.domain.StockDetailBack;

@Controller
@RequestMapping(value = "stock")
public class StockController extends BaseController {

	@Autowired
	private StockService service;

	@Autowired
	private StockDetailService stockDetailService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(@RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
			@RequestParam(value = "pagesize", required = true, defaultValue = "10") int pagesize, Model model) {
		return getView("stock/index");

	}

	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id")Long id, Model model) {
		Stock stock=service.findById(id);
		model.addAttribute("stock", service.findById(id));
		if (stock!=null) {
			try {
				StockDetail bean = new StockDetail();
				StockApi api = new StockListApiImpl();
				StockDetailBack back = api.findByCode(stock.getCode());
				BeanUtils.copyProperties(back, bean);
				bean.setStock(stock);
				stockDetailService.save(bean);
				model.addAttribute("detail",bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return getView("stock/view");
	}
	@RequestMapping(value = "/code/{id}", method = RequestMethod.GET)
	public String code(@PathVariable("id")String code, Model model) {
		Stock stock=service.findByCode(code);
		model.addAttribute("stock", stock);
		if (stock!=null) {
			try {
				StockDetail bean = new StockDetail();
				StockApi api = new StockListApiImpl();
				StockDetailBack back = api.findByCode(stock.getCode());
				BeanUtils.copyProperties(back, bean);
				bean.setStock(stock);
				stockDetailService.save(bean);
				model.addAttribute("detail",bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return getView("stock/view");
	}
}
