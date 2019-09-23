package com.haoxuer.ucms.questions.api.domain.request;

import com.haoxuer.ucms.member.api.domain.request.BasePageRequest;
import lombok.Data;

@Data
public class AnswerPageRequest extends BasePageRequest {

    private Long id;
}
