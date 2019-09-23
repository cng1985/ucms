package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionVote;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionVoteService {

	QuestionVote findById(Long id);

	QuestionVote save(QuestionVote bean);

	QuestionVote update(QuestionVote bean);

	QuestionVote deleteById(Long id);
	
	QuestionVote[] deleteByIds(Long[] ids);
	
	Page<QuestionVote> page(Pageable pageable);
	
	Page<QuestionVote> page(Pageable pageable, Object search);


	List<QuestionVote> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}