package com.haoxuer.ucms.questions.api.domain.simple;

import com.haoxuer.ucms.member.api.domain.simple.MemberSimple;
import lombok.Data;

import java.io.Serializable;

@Data
public class AnswerSimple implements Serializable {

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
