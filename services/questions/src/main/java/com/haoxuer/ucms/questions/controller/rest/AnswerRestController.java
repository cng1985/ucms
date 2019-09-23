package com.haoxuer.ucms.questions.controller.rest;


import com.haoxuer.discover.user.service.UserTokenService;
import com.haoxuer.ucms.member.data.entity.Member;
import com.haoxuer.ucms.member.utils.MemberUtils;
import com.haoxuer.ucms.questions.api.apis.AnswerApi;
import com.haoxuer.ucms.questions.api.domain.page.AnswerPage;
import com.haoxuer.ucms.questions.api.domain.request.AnswerPageRequest;
import com.haoxuer.ucms.questions.api.domain.request.AnswerRequest;
import com.haoxuer.ucms.questions.api.domain.response.AnswerResponse;
import com.haoxuer.ucms.questions.controller.request.AnswerPostRequest;
import com.haoxuer.ucms.questions.data.entity.Question;
import com.haoxuer.ucms.questions.data.entity.QuestionAnswer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/question/answer")
public class AnswerRestController {

    @Autowired
    private UserTokenService tokenService;

    @RequestMapping(value = "/answer")
    public AnswerResponse answer(AnswerPostRequest request) {
        AnswerResponse result = new AnswerResponse();
        Member member = null;
        if (request.getUserToken() != null) {
            Long user = tokenService.user(request.getUserToken());
            member = Member.fromId(user);
        }
        if (member == null) {
            member = MemberUtils.member();
        }
        if (member == null) {
            result.setCode(-1);
            result.setMsg("无效用户");
            return result;
        }
        if (request.getNote() == null) {
            result.setCode(-2);
            result.setMsg("没有填写信息");
            return result;
        }
        if (request.getQuestion() == null) {
            result.setCode(-3);
            result.setMsg("问题不存在");
            return result;
        }
        QuestionAnswer answer = new QuestionAnswer();
        answer.setMember(member);
        answer.setQuestion(Question.fromId(request.getQuestion()));
        answer.setNote(request.getNote());
        AnswerRequest post=new AnswerRequest();
        post.setAnswer(answer);
        return api.answer(post);
    }

    @RequestMapping(value = "/page")
    public AnswerPage page(AnswerPageRequest request) {
        return api.page(request);
    }

    @Autowired
    private AnswerApi api;
}
