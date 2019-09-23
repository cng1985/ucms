package com.haoxuer.ucms.questions.controller.request;

import com.haoxuer.ucms.member.api.domain.request.BasePageRequest;
import lombok.Data;
import org.springframework.util.StringUtils;

@Data
public class AnswerPostRequest extends BasePageRequest {

    private Long question;

    private String note;
}
