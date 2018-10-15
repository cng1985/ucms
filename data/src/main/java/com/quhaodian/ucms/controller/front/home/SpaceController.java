package com.quhaodian.ucms.controller.front.home;

import com.quhaodian.ucms.data.entity.Member;
import com.quhaodian.ucms.data.service.MemberService;
import com.haoxuer.discover.web.controller.front.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by cng19 on 2017/6/23.
 */

@Scope("prototype")
@Controller
@RequestMapping(value = "space")
public class SpaceController extends BaseController {

    @Autowired
    MemberService service;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(@PathVariable("id")Long id, Model model) {
        Member member=service.findById(id);
        if (member==null){
              return redirect("/index.htm");
        }else {
            model.addAttribute("model",member);
            return getView("space/view");
        }

    }
}
