package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.data.entity.AbstractEntity;
import lombok.Data;

import javax.persistence.*;

/**
 * 回答投票
 * 
 * @author 年高
 *
 */
@Data
@Entity
@Table(name = "question_answer_vote")
public class QuestionAnswerVote extends AbstractEntity{


	/**
	 * 用户
	 */
	@JoinColumn(name = "userid")
	@ManyToOne(fetch = FetchType.LAZY)
	private User user;

	/**
	 * 问题的回答
	 */
	@JoinColumn
	@ManyToOne(fetch = FetchType.LAZY)
	private QuestionAnswer answer;
	
	/**
	 * 投票数量
	 */
	private Integer vote;
	
	/**
	 * 投票类型
	 */
	private Integer flag;


}
