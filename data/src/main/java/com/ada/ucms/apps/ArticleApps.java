package com.ada.ucms.apps;

import com.ada.article.data.entity.Article;
import com.ada.article.data.entity.ArticleCatalog;
import com.ada.article.data.service.ArticleService;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;

import java.util.List;

public class ArticleApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArticleService service = ObjectFactory.get().getBean(ArticleService.class);
		Pageable pager=new Pageable();
		Page<Article> a=service.page(pager);
		List<Article> as=	a.getContent();
	}

	private static void add() {
		ArticleService service = ObjectFactory.get().getBean(ArticleService.class);
		
		Article c=new 		Article();
		ArticleCatalog catalog=new ArticleCatalog();
		catalog.setId(66);
		c.setCatalog(catalog);
		//service.deleteById(6l);
		service.save(c);
	}

}
