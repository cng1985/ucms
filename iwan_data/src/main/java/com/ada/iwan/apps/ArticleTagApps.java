package com.ada.iwan.apps;

import com.ada.article.entity.Article;
import com.ada.article.service.ArticleService;
import com.ada.data.core.Pagination;

import java.util.List;

public class ArticleTagApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArticleService service = ObjectFactory.get().getBean(ArticleService.class);

		Pagination<Article> ss = service.getPage(0, 10);
		List<Article> as = ss.getList();
		for (Article article : as) {
		}
	}

	public static void ss() {
		// 构建IK分词器，使用smart分词模式
		String key = "这是一个中文分词的例子，你可以直接运行它！IKAnalyer can analysis english text too";
	}



}
