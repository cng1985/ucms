package com.ada.iwan.viewers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ada.article.data.entity.Article;
import org.springframework.web.servlet.view.feed.AbstractRssFeedView;

import com.rometools.rome.feed.rss.Channel;
import com.rometools.rome.feed.rss.Content;
import com.rometools.rome.feed.rss.Item;


public class CustomRssViewer extends AbstractRssFeedView {

	@Override
	protected void buildFeedMetadata(Map<String, Object> model, Channel feed,
			HttpServletRequest request) {
		
		feed.setTitle("一尺三寸");
		feed.setDescription("一尺三寸一个提供大家交流的地方，全部代码开源。我为人人，人人为我！塑造一种开源骑士精神！");
		feed.setLink("http://www.yichisancun.com");
		
		super.buildFeedMetadata(model, feed, request);
	}
	
	
	@Override
	protected List<Item> buildFeedItems(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		@SuppressWarnings("unchecked")
		List<Article> listContent = (List<Article>) model.get("feedContent");
		List<Item> items = new ArrayList<Item>(listContent.size());
		
		for(Article tempContent : listContent ){
		
			Item item = new Item();
			
			Content content = new Content();
			content.setValue(tempContent.getIntroduction());
			item.setContent(content);
			
			item.setTitle(tempContent.getTitle());
			item.setLink("http://www.yichisancun.com/article/view/"+tempContent.getId()+".htm");
			item.setPubDate(tempContent.getAddDate());
			
			items.add(item);
		}
		
		return items;
	}

	
}