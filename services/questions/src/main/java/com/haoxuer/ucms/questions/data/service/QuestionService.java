package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.Question;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionService {

	Question findById(Long id);

	Question save(Question bean);

	Question update(Question bean);

	Question deleteById(Long id);
	
	Question[] deleteByIds(Long[] ids);
	
	Page<Question> page(Pageable pageable);
	
	Page<Question> page(Pageable pageable, Object search);


	List<Question> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}