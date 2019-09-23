package com.haoxuer.ucms.questions.api.domain.request;

import com.haoxuer.ucms.member.api.domain.request.BaseRequest;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;
import lombok.Data;

@Data
public class AnswerRequest extends BaseRequest {

    private QuestionAnswer answer;

}
