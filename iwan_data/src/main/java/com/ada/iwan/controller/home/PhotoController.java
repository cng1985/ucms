package com.ada.iwan.controller.home;

import com.ada.album.data.entity.Photo;
import com.ada.album.data.service.CategoryService;
import com.ada.album.data.service.PhotoService;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ada.iwan.controller.BaseController;

@Controller
@RequestMapping(value = "photo")
public class PhotoController extends BaseController {

    @Autowired
    PhotoService service;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(@RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
                        @RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize, Model model) {
        Pageable pager = new Pageable();

        Pageable pagercatalog = new Pageable();
        pagercatalog.setPageSize(20);
        Page<Photo> page = service.page(pager);
        model.addAttribute("photos", page.getContent());
        model.addAttribute("catalogs", categoryService.page(pagercatalog).getContent());
        model.addAttribute("page", page);
        model.addAttribute("curpage", curpage);
        model.addAttribute("pagesize", pagesize);
        return getView("photo/index");
    }

    @RequestMapping(value = "/catalog", method = RequestMethod.GET)
    public String catalog(String id, @RequestParam(value = "curpage", required = true, defaultValue = "1") int curpage,
                          @RequestParam(value = "pagesize", required = true, defaultValue = "20") int pagesize, Model model) {
        Pageable pager = new Pageable();
        Page<Photo> page = service.page(pager);

        Pageable pagercatalog = new Pageable();
        pagercatalog.setPageSize(20);

        model.addAttribute("photos", page.getContent());
        model.addAttribute("catalogs", categoryService.page(pagercatalog).getContent());
        model.addAttribute("page", page);
        model.addAttribute("id", id);
        model.addAttribute("curpage", curpage);
        model.addAttribute("pagesize", pagesize);

        return getView("photo/catalog");
    }
}
