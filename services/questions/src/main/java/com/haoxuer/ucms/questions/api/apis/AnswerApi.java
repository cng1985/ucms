package com.haoxuer.ucms.questions.api.apis;

import com.haoxuer.ucms.questions.api.domain.page.AnswerPage;
import com.haoxuer.ucms.questions.api.domain.request.AnswerPageRequest;
import com.haoxuer.ucms.questions.api.domain.request.AnswerRequest;
import com.haoxuer.ucms.questions.api.domain.response.AnswerResponse;

public interface AnswerApi {

    /**
     * 回答一个问题
     * @param request
     * @return
     */
    AnswerResponse answer(AnswerRequest request);

    AnswerPage page(AnswerPageRequest request);
}
