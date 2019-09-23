package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.data.entity.AbstractEntity;
import com.haoxuer.ucms.member.data.entity.Member;
import lombok.Data;

import javax.persistence.*;


/**
 * 提问回答
 * 
 * @author 年高
 *
 */
@Data
@Entity
@Table(name = "question_answer")
public class QuestionAnswer extends AbstractEntity {
	

	/**
	 * 用户
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private Member member;
	
	@JoinColumn
	@ManyToOne(fetch = FetchType.LAZY)
	private Question question;
	
	/**
	 * 标题
	 */
	private String title;

	/**
	 * 回答内容
	 */
	private String note;

	/**
	 * 支持人数
	 */
	private Long ups;
	

	/**
	 * 回答是否被采纳
	 */
	private Integer state;


}
