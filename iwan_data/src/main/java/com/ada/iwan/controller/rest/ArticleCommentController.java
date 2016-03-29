package com.ada.iwan.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ada.article.rest.api.ArticleCommentApi;
import com.ada.article.rest.page.ArticleCommentPageVo;

@RequestMapping(value = "articlecomment")
@RestController()
public class ArticleCommentController {

	@Autowired
	private ArticleCommentApi api;

	@RequestMapping(value = "/page")
	public ArticleCommentPageVo page(Long aid,
			@RequestParam(value = "pageno", required = true, defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", required = true, defaultValue = "10") Integer pagesize) {
		return api.page(aid, pageno, pagesize);
	}
}
