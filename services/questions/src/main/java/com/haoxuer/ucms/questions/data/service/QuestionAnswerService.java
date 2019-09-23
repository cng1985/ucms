package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionAnswerService {

	QuestionAnswer findById(Long id);

	QuestionAnswer save(QuestionAnswer bean);

	QuestionAnswer update(QuestionAnswer bean);

	QuestionAnswer deleteById(Long id);
	
	QuestionAnswer[] deleteByIds(Long[] ids);
	
	Page<QuestionAnswer> page(Pageable pageable);
	
	Page<QuestionAnswer> page(Pageable pageable, Object search);


	List<QuestionAnswer> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}