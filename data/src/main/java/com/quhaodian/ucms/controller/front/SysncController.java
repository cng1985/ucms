package com.quhaodian.ucms.controller.front;

import com.haoxuer.discover.rest.base.ResponseObject;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.service.StockService;
import com.quhaodian.ucms.threads.StockTimeSyncThread;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


@RequestMapping("sync")
@Controller
public class SysncController extends BaseController {

    @Autowired
    private StockService manager;

    @ResponseBody
    @RequestMapping("/stock/times")
    public String comp(Stock bean, ModelMap model) {
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


        return getView("index");
    }

    @ResponseBody
    @RequestMapping("/stock/sync")
    public ResponseObject sync(Stock bean, ModelMap model) {
        ResponseObject result=new ResponseObject();
        new Thread(new Runnable() {
            @Override
            public void run() {
                manager.sync();
            }
        }).start();
        return result;
    }
}
