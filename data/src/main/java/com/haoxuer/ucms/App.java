package com.haoxuer.ucms;

import com.haoxuer.imake.ChainMake;
import com.haoxuer.imake.template.hibernate.TemplateHibernateDir;
import com.haoxuer.imake.templates.adminlte.TemplateAdminLTE;
import com.haoxuer.ucms.controller.admin.Controllers;
import com.haoxuer.ucms.data.entity.ExceptionLog;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Hello world!
 */
public class App {
  public static void main(String[] args) {

    System.out.println(Controllers.class.getResource("/").getPath());
    ChainMake make = new ChainMake(TemplateAdminLTE.class, TemplateHibernateDir.class);
    make.setAction(Controllers.class.getPackage().getName());
    File view = new File("D:\\mvnspace\\iwan\\web\\src\\main\\webapp\\WEB-INF\\ftl\\admin");
    make.setView(view);

    List<Class<?>> cs = new ArrayList<Class<?>>();
    cs.add(ExceptionLog.class);

    make.setMenus("1,32,34");
    make.setDao(true);
    make.setService(true);
    make.setView(false);
    make.setAction(false);
    make.makes(cs);
  }


}
