package com.haoxuer.ucms.questions.data.service;

import com.haoxuer.ucms.questions.data.entity.QuestionAnswerVote;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import java.util.List;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionAnswerVoteService {

	QuestionAnswerVote findById(Long id);

	QuestionAnswerVote save(QuestionAnswerVote bean);

	QuestionAnswerVote update(QuestionAnswerVote bean);

	QuestionAnswerVote deleteById(Long id);
	
	QuestionAnswerVote[] deleteByIds(Long[] ids);
	
	Page<QuestionAnswerVote> page(Pageable pageable);
	
	Page<QuestionAnswerVote> page(Pageable pageable, Object search);


	List<QuestionAnswerVote> list(int first, Integer size, List<Filter> filters, List<Order> orders);

}