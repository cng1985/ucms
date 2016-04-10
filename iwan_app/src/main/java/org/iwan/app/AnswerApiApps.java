package org.iwan.app;

import java.util.List;

import com.ada.iwan.apps.ObjectFactory;
import com.ada.question.rest.api.AnswerApi;
import com.ada.question.rest.page.AnswerPageVo;
import com.ada.question.rest.vo.AnswerVo;

public class AnswerApiApps {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AnswerApi service = ObjectFactory.get().getBean(AnswerApi.class);
		AnswerPageVo pagevo = service.pageByQuestion(475l, 1, 100);
		List<AnswerVo> vos=	pagevo.getList();
		
		for (AnswerVo answerVo : vos) {
			System.out.println(answerVo);
		}
	}

}
