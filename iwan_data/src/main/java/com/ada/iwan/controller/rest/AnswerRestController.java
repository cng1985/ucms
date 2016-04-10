package com.ada.iwan.controller.rest;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ada.article.entity.Article;
import com.ada.question.entity.Question;
import com.ada.question.entity.QuestionAnswer;
import com.ada.question.resource.conver.AnswerVoConver;
import com.ada.question.rest.api.AnswerApi;
import com.ada.question.rest.page.AnswerPageVo;
import com.ada.question.rest.vo.AnswerVo;
import com.ada.question.service.QuestionAnswerService;
import com.ada.shiro.utils.UserUtil;

@RequestMapping(value = "answer")
@RestController()
public class AnswerRestController {
	
	
	@Autowired
	private AnswerApi api;

	
	@RequestMapping(value = "/page")
	public AnswerPageVo pageByQuestion(Long questionid,@RequestParam(value = "pageno", required = true, defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", required = true, defaultValue = "10") Integer pagesize) {
		return api.pageByQuestion(questionid, pageno, pagesize);
	}
	
	@Autowired
	private QuestionAnswerService answerService;

	@RequiresUser
	@RequestMapping(value = "/answer")
	public AnswerVo commit(String comment,Long qid) {
		AnswerVo result=null;;
		QuestionAnswer bean=new QuestionAnswer();
		bean.setUser(UserUtil.getCurrentUser());
		bean.setContents(comment);
		Question question=new Question();
		question.setId(qid);
		bean.setQuestion(question);
		answerService.save(bean);
		AnswerVoConver commentVoConver=new AnswerVoConver();
		result=commentVoConver.conver(bean);
		return result;
	}
}
