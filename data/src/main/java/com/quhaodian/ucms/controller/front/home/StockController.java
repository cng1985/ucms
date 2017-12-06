package com.quhaodian.ucms.controller.front.home;

import com.quhaodian.web.controller.front.BaseController;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.ucms.data.service.StockDetailService;
import com.quhaodian.ucms.data.service.StockService;
import com.quhaodian.ucms.service.stock.api.StockApi;
import com.quhaodian.ucms.service.stock.api.impl.StockListApiImpl;
import com.quhaodian.ucms.service.stock.domain.StockDetailBack;

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