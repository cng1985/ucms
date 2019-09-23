package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.data.entity.AbstractEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 回答投票
 * 
 * @author 年高
 *
 */
@Data
@Entity
@Table(name = "question_vote")
public class QuestionVote extends AbstractEntity {


	/**
	 * 用户
	 */
	@JoinColumn(name = "userid")
	@ManyToOne()
	private User user;

	/**
	 * 问题的回答
	 */
	@JoinColumn
	@ManyToOne()
	private Question question;
	
	/**
	 * 投票数量
	 */
	private Integer vote;
	
	/**
	 * 投票类型
	 */
	private Integer flag;

}
