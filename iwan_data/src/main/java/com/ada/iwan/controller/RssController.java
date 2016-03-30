package com.ada.iwan.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ada.article.entity.Article;
import com.ada.article.service.ArticleService;

@Controller
public class RssController {
	
	@Autowired
	ArticleService articleService;
	
	
	@RequestMapping(value="/rssfeed", method = RequestMethod.GET)
	public ModelAndView getFeedInRss() {

		List<Article> items = new ArrayList<Article>();
		
		items=articleService.getPage(1, 20).getList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rssViewer");
		mav.addObject("feedContent", items);
		
		return mav;

	}
}
