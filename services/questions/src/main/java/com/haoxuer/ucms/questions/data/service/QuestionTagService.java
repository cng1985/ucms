package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionTag;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionTagService {

	QuestionTag findById(Long id);

	QuestionTag save(QuestionTag bean);

	QuestionTag update(QuestionTag bean);

	QuestionTag deleteById(Long id);
	
	QuestionTag[] deleteByIds(Long[] ids);
	
	Page<QuestionTag> page(Pageable pageable);
	
	Page<QuestionTag> page(Pageable pageable, Object search);


	List<QuestionTag> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}