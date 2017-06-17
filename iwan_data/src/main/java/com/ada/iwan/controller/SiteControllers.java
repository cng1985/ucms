package com.ada.iwan.controller;

import com.ada.data.rest.domain.AbstractVo;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

/**
 * Created by cng19 on 2017/6/17.
 */


@ControllerAdvice
public class SiteControllers extends AbstractJsonpResponseBodyAdvice {
    public SiteControllers() {
        super("callback");
    }

    @ExceptionHandler(AuthorizationException.class)
    @ResponseBody
    public AbstractVo unauthenticatedException(){
        AbstractVo result=new AbstractVo();
        result.setCode(-1);
        result.setMsg("该账号没登陆!");
        return result;
    }

}
