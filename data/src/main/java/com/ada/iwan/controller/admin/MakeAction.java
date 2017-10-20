package com.ada.iwan.controller.admin;

import com.ada.article.data.service.ArticleCatalogService;
import com.ada.article.data.service.ArticleService;
import com.ada.data.page.Pageable;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;

/**
 * Created by cng19 on 2017/3/12.
 */

@Controller
public class MakeAction implements ServletContextAware {

    @Autowired
    ArticleService articleService;


    @Autowired
    ArticleCatalogService articleCatalogService;

    public static final String UTF8 = "UTF-8";

    @Autowired
    FreeMarkerConfigurer configurer;

    private Configuration conf;

    @RequestMapping("/admin/make/view_index")
    public String makeIndex(ModelMap model) {
        File f= new File(get("index.html"));
        if (f!=null){
            model.addAttribute("lastDate",new Date(f.lastModified()));
        }
        return "admin/make/view_index";
    }

    protected String getView(String view) {
        return "/theme/default/" + view;
    }

    @RequestMapping("/admin/make/make_index")
    public String makeIndexWork(ModelMap model) {

        Writer out = null;
        try {
            Pageable pager=new Pageable();
            model.addAttribute("articles", articleService.page(pager).getContent());
           // model.addAttribute("catalogs", articleCatalogService.findChild(1));
            conf = configurer.getConfiguration();
            File f;
            f = new File(get("index.html"));
            File parent = f.getParentFile();
            if (!parent.exists()) {
                parent.mkdirs();
            }

            // FileWriter不能指定编码确实是个问题，只能用这个代替了。
            out = new OutputStreamWriter(new FileOutputStream(f), UTF8);
            Template template = conf.getTemplate(getView("index")+".html");
            template.process(model, out);
            model.addAttribute("msg", "生成成功");

        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }

        return "admin/make/view_index";
    }

    public String get(String path) {
        String realpath = context.getRealPath(path);
        //tomcat8.0获取不到真实路径，通过/获取路径
        if (realpath == null) {
            realpath = context.getRealPath("/") + path;
        }
        return realpath;
    }

    private ServletContext context;

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.context = servletContext;
    }
}
