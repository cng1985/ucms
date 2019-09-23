package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionFavorite;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionFavoriteService {

	QuestionFavorite findById(Long id);

	QuestionFavorite save(QuestionFavorite bean);

	QuestionFavorite update(QuestionFavorite bean);

	QuestionFavorite deleteById(Long id);
	
	QuestionFavorite[] deleteByIds(Long[] ids);
	
	Page<QuestionFavorite> page(Pageable pageable);
	
	Page<QuestionFavorite> page(Pageable pageable, Object search);


	List<QuestionFavorite> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}