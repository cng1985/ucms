package com.haoxuer.ucms.apps;


import com.haoxuer.discover.article.data.entity.ArticleCatalog;
import com.haoxuer.discover.article.data.service.ArticleCatalogService;

public class ArticleCatalogApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ArticleCatalogService service = ObjectFactory.get().getBean(
				ArticleCatalogService.class);
		ArticleCatalog p=new ArticleCatalog();
		p.setId(4);
		for (int i = 0; i < 50; i++) {
			ArticleCatalog c=new 	ArticleCatalog();
			c.setName("c:"+i);
			c.setParent(p);
			service.save(c);
			p=c;
		}
		
	}

}
