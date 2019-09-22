package com.haoxuer.ucms.controller.front;

import com.haoxuer.discover.article.data.entity.ArticleCatalog;
import com.haoxuer.discover.article.data.service.ArticleCatalogService;
import com.haoxuer.discover.article.data.service.ArticleService;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.discover.user.utils.ListUtils;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sdk.GeetestConfig;
import sdk.GeetestLib;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@Controller
public class IndexController extends BaseController {

  @Autowired
  ArticleService articleService;


  @Autowired
  ArticleCatalogService articleCatalogService;


  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public String index(Model model) {


    Pageable pager = new Pageable();
    pager.getOrders().add(Order.desc("id"));
    Pageable pagerlike = new Pageable();
    pagerlike.getOrders().add(Order.desc("likes"));
    model.addAttribute("likes", articleService.page(pagerlike).getContent());

    Pageable pagerviews = new Pageable();
    pagerviews.getOrders().add(Order.desc("views"));
    model.addAttribute("views", articleService.page(pagerviews).getContent());
    model.addAttribute("articles", articleService.page(pager).getContent());
    List<ArticleCatalog> catalogs = articleCatalogService.list(0, 1000, ListUtils.list(Filter.eq("parent.id", 1)), null);
    model.addAttribute("catalogs", catalogs);
    return getView("index");
  }


  @ResponseBody
  @RequestMapping(value = "/startcaptcha", method = RequestMethod.GET)
  public String startCaptcha(HttpServletRequest request, Model model) {
    GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
        GeetestConfig.isnewfailback());

    String resStr = "{}";

    String userid = "test";

    //自定义参数,可选择添加
    HashMap<String, String> param = new HashMap<String, String>();
    param.put("user_id", userid); //网站用户id
    param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
    try {
      param.put("ip_address", getIpAddr(request)); //传输用户请求验证时所携带的IP
    } catch (Exception e) {
      e.printStackTrace();
    }

    //进行验证预处理
    int gtServerStatus = gtSdk.preProcess(param);

    //将服务器状态设置到session中
    request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
    //将userid设置到session中
    request.getSession().setAttribute("userid", userid);

    return gtSdk.getResponseStr();


  }


  @ResponseBody
  @RequestMapping(value = "/verifylogin", method = RequestMethod.GET)
  public VerifyVo verifyLogin(HttpServletRequest request, Model model) {
    VerifyVo result = new VerifyVo();
    GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
        GeetestConfig.isnewfailback());

    String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
    String validate = request.getParameter(GeetestLib.fn_geetest_validate);
    String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);

    //从session中获取gt-server状态
    int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

    //从session中获取userid
    String userid = (String) request.getSession().getAttribute("userid");

    //自定义参数,可选择添加
    HashMap<String, String> param = new HashMap<String, String>();
    param.put("user_id", userid); //网站用户id
    param.put("client_type", "web"); //web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
    param.put("ip_address", "127.0.0.1"); //传输用户请求验证时所携带的IP

    int gtResult = 0;

    if (gt_server_status_code == 1) {
      //gt-server正常，向gt-server进行二次验证

      gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, param);
      System.out.println(gtResult);
    } else {
      // gt-server非正常情况下，进行failback模式验证

      System.out.println("failback:use your own server captcha validate");
      gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
      System.out.println(gtResult);
    }


    if (gtResult == 1) {
      // 验证成功
        result.setStatus("success");
        result.setVersion(gtSdk.getVersionInfo());
    } else {
      result.setStatus("fail");
      result.setVersion(gtSdk.getVersionInfo());
      // 验证失败
    }

    return result;

  }
}
