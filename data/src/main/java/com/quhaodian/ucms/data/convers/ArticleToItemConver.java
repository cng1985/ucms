package com.quhaodian.ucms.data.convers;

import com.haoxuer.discover.article.data.entity.Article;
import com.haoxuer.discover.data.rest.core.Conver;
import com.rometools.rome.feed.rss.Content;
import com.rometools.rome.feed.rss.Item;

public class ArticleToItemConver implements Conver<Item, Article> {
  @Override
  public Item conver(Article source) {
    Item result=new Item();
    Content content = new Content();
    content.setValue(source.getIntroduction());
    result.setContent(content);

    result.setTitle(source.getTitle());
    result.setLink("https://www.haoxuer.com/article/view/"+source.getId()+".htm");
    result.setPubDate(source.getAddDate());

    return result;
  }
}
