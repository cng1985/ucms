package com.haoxuer.ucms.questions.rest.conver;

import com.haoxuer.discover.data.rest.core.Conver;
import com.haoxuer.ucms.member.api.domain.simple.MemberSimple;
import com.haoxuer.ucms.member.rest.conver.MemberSimpleConver;
import com.haoxuer.ucms.member.utils.DateUtils;
import com.haoxuer.ucms.questions.api.domain.response.AnswerResponse;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;

public class AnswerResponseConver implements Conver<AnswerResponse, QuestionAnswer> {
    @Override
    public AnswerResponse conver(QuestionAnswer source) {
        AnswerResponse result = new AnswerResponse();
        result.setTitle(source.getTitle());
        result.setNote(source.getNote());
        if (source.getMember() != null) {
            result.setMember(new MemberSimpleConver().conver(source.getMember()));
        }
        result.setDate(DateUtils.formatChines(source.getAddDate()));
        result.setSimpleDate(DateUtils.simple(source.getAddDate()));
        result.setUps(0L);
        return result;
    }
}
