package com.quhaodian.ucms.apps;

import com.haoxuer.discover.article.data.entity.Article;
import com.haoxuer.discover.article.data.service.ArticleService;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;

import java.util.List;

public class ArticleTagApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArticleService service = ObjectFactory.get().getBean(ArticleService.class);

		Pageable pager=new Pageable();
		Page<Article> ss = service.page(pager);
		List<Article> as = ss.getContent();
		for (Article article : as) {
		}
	}

	public static void ss() {
		// 构建IK分词器，使用smart分词模式
		String key = "这是一个中文分词的例子，你可以直接运行它！IKAnalyer can analysis english text too";
	}



}
