package com.ada.iwan.controller.rest;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ada.article.entity.Article;
import com.ada.article.entity.ArticleComment;
import com.ada.article.resource.conver.ArticleCommentVoConver;
import com.ada.article.rest.api.ArticleCommentApi;
import com.ada.article.rest.page.ArticleCommentPageVo;
import com.ada.article.rest.vo.ArticleCommentVo;
import com.ada.article.service.ArticleCommentService;
import com.ada.shiro.utils.UserUtil;

@RequestMapping(value = "articlecomment")
@RestController()
public class ArticleCommentController {

	@Autowired
	private ArticleCommentApi api;
	
	@Autowired
	private ArticleCommentService service;

	@RequestMapping(value = "/page")
	public ArticleCommentPageVo page(Long aid,
			@RequestParam(value = "pageno", required = true, defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", required = true, defaultValue = "10") Integer pagesize) {
		return api.page(aid, pageno, pagesize);
	}
	
	@RequiresUser
	@RequestMapping(value = "/commit")
	public ArticleCommentVo commit(String comment,Long aid) {
		ArticleCommentVo result=null;;
		ArticleComment comment1=new ArticleComment();
		comment1.setUser(UserUtil.getCurrentUser());
		comment1.setContents(comment);
		Article article=new Article();
		article.setId(aid);
		comment1.setArticle(article);
		service.save(comment1);
		ArticleCommentVoConver commentVoConver=new ArticleCommentVoConver();
		result=commentVoConver.conver(comment1);
		return result;
	}
}
