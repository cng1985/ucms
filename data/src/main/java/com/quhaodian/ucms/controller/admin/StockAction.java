package com.quhaodian.ucms.controller.admin;

import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.data.utils.FilterUtils;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.service.StockService;
import com.quhaodian.ucms.data.so.StockSo;
import com.quhaodian.ucms.threads.StockTimeSyncThread;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by imake on 2018年05月19日18:48:51.
 */


@Scope("prototype")
@Controller
public class StockAction {
  
  public static final String MODEL = "model";
  
  public static final String REDIRECT_LIST_HTML = "redirect:/admin/stock/view_list.htm";
  
  private static final Logger log = LoggerFactory.getLogger(StockAction.class);
  
  @Autowired
  private StockService manager;
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/view_list")
  public String list(Pageable pageable, StockSo so, ModelMap model) {
    
    if (pageable == null) {
      pageable = new Pageable();
    }
    if (pageable.getOrders().isEmpty()) {
      pageable.getOrders().add(Order.desc("id"));
    }
    pageable.getFilters().addAll(FilterUtils.getFilters(so));
    Page<Stock> pagination = manager.findPage(pageable);
    model.addAttribute("list", pagination.getContent());
    model.addAttribute("page", pagination);
    model.addAttribute("so", so);
    return "/admin/stock/list";
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/view_add")
  public String add(ModelMap model) {
    return "/admin/stock/add";
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/view_edit")
  public String edit(Pageable pageable, Long id, ModelMap model) {
    model.addAttribute(MODEL, manager.findById(id));
    model.addAttribute("page", pageable);
    return "/admin/stock/edit";
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/view_view")
  public String view(Long id, ModelMap model) {
    model.addAttribute(MODEL, manager.findById(id));
    return "/admin/stock/view";
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/model_save")
  public String save(Stock bean, ModelMap model) {
    
    String view = REDIRECT_LIST_HTML;
    try {
      manager.save(bean);
      log.info("save object id={}", bean.getId());
    } catch (Exception e) {
      log.error("保存失败", e);
      model.addAttribute("erro", e.getMessage());
      view = "/admin/stock/add";
    }
    return view;
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/sync")
  public String sync(Stock bean, ModelMap model) {
    
    String view = REDIRECT_LIST_HTML;
    manager.sync();
    return view;
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/comp")
  public String comp(Stock bean, ModelMap model) {
    String view = REDIRECT_LIST_HTML;
    new Thread(new Runnable() {
      @Override
      public void run() {
        ExecutorService cachedThreadPool = Executors.newFixedThreadPool(35);
        
        manager.compute();
        List<Stock> stocks = manager.findList(0, 5000, null, null);
        if (stocks != null) {
          for (Stock stock : stocks) {
            Runnable thread = new StockTimeSyncThread(manager, stock.getId());
            cachedThreadPool.execute(thread);
          }
        }
      }
    }).start();
    
    
    return view;
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/time")
  public String time(Long id, ModelMap model) {
    
    String view = REDIRECT_LIST_HTML;
    manager.time(id);
    return view;
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/model_update")
  public String update(Pageable pageable, Stock bean, RedirectAttributes redirectAttributes, ModelMap model) {
    
    String view = REDIRECT_LIST_HTML;
    try {
      manager.update(bean);
      initRedirectData(pageable, redirectAttributes);
    } catch (Exception e) {
      log.error("更新失败", e);
      model.addAttribute("erro", e.getMessage());
      model.addAttribute(MODEL, bean);
      model.addAttribute("page", pageable);
      view = "/admin/stock/edit";
    }
    return view;
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/model_delete")
  public String delete(Pageable pageable, Long id, RedirectAttributes redirectAttributes) {
    
    String view = REDIRECT_LIST_HTML;
    
    try {
      initRedirectData(pageable, redirectAttributes);
      manager.deleteById(id);
    } catch (DataIntegrityViolationException e) {
      log.error("删除失败", e);
      redirectAttributes.addFlashAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
    }
    
    return view;
  }
  
  @RequiresPermissions("stock")
  @RequestMapping("/admin/stock/model_deletes")
  public String deletes(Pageable pageable, Long[] ids, RedirectAttributes redirectAttributes) {
    
    String view = REDIRECT_LIST_HTML;
    
    try {
      initRedirectData(pageable, redirectAttributes);
      manager.deleteByIds(ids);
    } catch (DataIntegrityViolationException e) {
      log.error("批量删除失败", e);
      redirectAttributes.addFlashAttribute("erro", "该条数据不能删除，请先删除和他相关的类容!");
    }
    return view;
  }
  
  private void initRedirectData(Pageable pageable, RedirectAttributes redirectAttributes) {
    redirectAttributes.addAttribute("pageNumber", pageable.getPageNumber());
  }
}