package com.ada.iwan.apps;

import com.ada.article.entity.Article;
import com.ada.article.entity.ArticleCatalog;
import com.ada.article.service.ArticleService;
import com.ada.data.core.Pagination;

import java.util.List;

public class ArticleApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArticleService service = ObjectFactory.get().getBean(ArticleService.class);
		Pagination<Article>	a=service.getPage(1, 100);
		List<Article> as=	a.getList();
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
