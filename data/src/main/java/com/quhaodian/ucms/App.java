package com.quhaodian.ucms;

import com.quhaodian.imake.ChainMake;
import com.quhaodian.imake.template.hibernate.TemplateHibernateDir;
import com.quhaodian.imake.templates.adminlte.TemplateAdminLTE;
import com.quhaodian.notice.data.entity.UserNotificationMember;
import com.quhaodian.ucms.controller.admin.Controllers;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.entity.StockDayTime;

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
    cs.add(StockDayTime.class);

    make.setMenus("1,32,34");
    make.setDao(true);
    make.setService(true);
    make.setView(true);
    make.setAction(true);
    make.makes(cs);
  }


}
