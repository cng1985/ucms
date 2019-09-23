package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionCatalog;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionCatalogService {

	QuestionCatalog findById(Integer id);

	QuestionCatalog save(QuestionCatalog bean);

	QuestionCatalog update(QuestionCatalog bean);

	QuestionCatalog deleteById(Integer id);
	
	QuestionCatalog[] deleteByIds(Integer[] ids);
	
	Page<QuestionCatalog> page(Pageable pageable);
	
	Page<QuestionCatalog> page(Pageable pageable, Object search);

	List<QuestionCatalog> findByTops(Integer pid);


    List<QuestionCatalog> child(Integer id,Integer max);

	List<QuestionCatalog> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}