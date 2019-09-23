package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionWord;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionWordService {

	QuestionWord findById(Long id);

	QuestionWord save(QuestionWord bean);

	QuestionWord update(QuestionWord bean);

	QuestionWord deleteById(Long id);
	
	QuestionWord[] deleteByIds(Long[] ids);
	
	Page<QuestionWord> page(Pageable pageable);
	
	Page<QuestionWord> page(Pageable pageable, Object search);


	List<QuestionWord> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}