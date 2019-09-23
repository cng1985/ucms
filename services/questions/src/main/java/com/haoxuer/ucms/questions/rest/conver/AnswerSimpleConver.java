package com.haoxuer.ucms.questions.rest.conver;

import com.haoxuer.discover.data.rest.core.Conver;
import com.haoxuer.ucms.member.rest.conver.MemberSimpleConver;
import com.haoxuer.ucms.member.utils.DateUtils;
import com.haoxuer.ucms.questions.api.domain.simple.AnswerSimple;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;

public class AnswerSimpleConver implements Conver<AnswerSimple, QuestionAnswer> {
    @Override
    public AnswerSimple conver(QuestionAnswer source) {
        AnswerSimple result=new AnswerSimple();
        result.setTitle(source.getTitle());
        result.setNote(source.getNote());
        if (source.getMember() != null) {
            result.setMember(new MemberSimpleConver().conver(source.getMember()));
        }
        result.setDate(DateUtils.formatChines(source.getAddDate()));
        result.setSimpleDate(DateUtils.simple(source.getAddDate()));
        result.setUps(source.getUps());
        if (result.getUps()==null){
            result.setUps(0L);
        }
        return result;
    }
}
