package com.haoxuer.ucms.questions.rest.resource;

import com.haoxuer.discover.config.utils.ConverResourceUtils;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.haoxuer.ucms.member.rest.conver.PageableConver;
import com.haoxuer.ucms.questions.api.apis.AnswerApi;
import com.haoxuer.ucms.questions.api.domain.page.AnswerPage;
import com.haoxuer.ucms.questions.api.domain.request.AnswerPageRequest;
import com.haoxuer.ucms.questions.api.domain.request.AnswerRequest;
import com.haoxuer.ucms.questions.api.domain.response.AnswerResponse;
import com.haoxuer.ucms.questions.data.dao.QuestionAnswerDao;
import com.haoxuer.ucms.questions.data.entity.Question;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;
import com.haoxuer.ucms.questions.rest.conver.AnswerResponseConver;
import com.haoxuer.ucms.questions.rest.conver.AnswerSimpleConver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Scope("prototype")
@Component
@Transactional
public class AnswerResource implements AnswerApi {

    @Autowired
    private QuestionAnswerDao answerDao;

    @Override
    public AnswerResponse answer(AnswerRequest request) {
        AnswerResponse result = new AnswerResponse();
        QuestionAnswer answer = request.getAnswer();
        answerDao.save(answer);
        result = new AnswerResponseConver().conver(answer);
        return result;
    }

    @Override
    public AnswerPage page(AnswerPageRequest request) {
        AnswerPage result = new AnswerPage();
        Pageable pageable = new PageableConver().conver(request);
        pageable.getFilters().add(Filter.eq("question.id", request.getId()));
        pageable.getOrders().add(Order.desc("id"));
        Page<QuestionAnswer> page = answerDao.page(pageable);
        ConverResourceUtils.converPage(result, page, new AnswerSimpleConver());
        return result;
    }
}
