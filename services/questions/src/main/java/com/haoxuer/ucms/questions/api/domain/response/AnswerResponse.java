package com.haoxuer.ucms.questions.api.domain.response;

import com.haoxuer.discover.rest.base.ResponseObject;
import com.haoxuer.ucms.member.api.domain.simple.MemberSimple;
import lombok.Data;

@Data
public class AnswerResponse extends ResponseObject {

    /**
     * 标题
     */
    private String title;

    /**
     * 回答内容
     */
    private String note;

    private MemberSimple member;


    private String date;

    private String simpleDate;

    private Long ups;

}
