package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionPoints;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionPointsService {

	QuestionPoints findById(Long id);

	QuestionPoints save(QuestionPoints bean);

	QuestionPoints update(QuestionPoints bean);

	QuestionPoints deleteById(Long id);
	
	QuestionPoints[] deleteByIds(Long[] ids);
	
	Page<QuestionPoints> page(Pageable pageable);
	
	Page<QuestionPoints> page(Pageable pageable, Object search);


	List<QuestionPoints> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}