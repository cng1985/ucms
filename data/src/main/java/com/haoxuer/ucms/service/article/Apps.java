package com.haoxuer.ucms.service.article;

import com.haoxuer.discover.article.data.entity.Article;
import com.haoxuer.discover.article.data.entity.ArticleCatalog;
import com.haoxuer.discover.article.data.service.ArticleService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

public class Apps {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
        //114000000营销13/   9
		//108000000设计12/  19
		//20技术11/ 20
		String url = "http://www.tuicool.com/ah/20/%d?lang=1";
		for (int i = 20; i > -1; i--) {
			String	xurl=String.format(url, i);
			System.out.println(i);
			System.out.println(xurl);
			try {
				x(xurl,11);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		System.out.println();

		// x(url);
	}

	private static void x(String url,Integer catalogid) throws IOException, MalformedURLException {
		String burl = "http://www.tuicool.com";

		Jsoup.connect(url).execute().body();
		URL url2 = new URL(url);
		Document doc = Jsoup.parse(url2, 8000);
		Elements es = doc.select(".single_fake");
		for (Element element : es) {
			String title = element.select(".article-list-title").text();
			String ind = element.select(".article_cut").text();
			Element a = element.select(".article_title").select("a").get(0);
			String href = burl + a.attr("href");

			URL url4 = new URL(href);
			Document docx = Jsoup.parse(url4, 8000);
			String note = docx.select(".article_body").html();

			int size = docx.select(".new-label").size();

			Article article = new Article();
			article.setTitle(title);
			article.setIntroduction(ind);
			article.setContents(note);
			System.out.println(article);

			ArticleService articleService = null;
			String[] tags = new String[size];
			Elements ess = docx.select(".new-label");
			int i = 0;
			for (Element element2 : ess) {
				tags[i] = element2.text();
				i++;
			}
			ArticleCatalog catalog = new ArticleCatalog();
			catalog.setId(catalogid);
			article.setCatalog(catalog);
			//articleService.save(article, tags);
		}
	}

}
