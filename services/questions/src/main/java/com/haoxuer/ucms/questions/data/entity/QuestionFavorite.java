package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.data.entity.AbstractEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "question_favorite")
public class QuestionFavorite extends AbstractEntity {


	
	/**
	 * 用户
	 */
	@JoinColumn(name = "userid")
	@ManyToOne()
	private User user;
	
	@JoinColumn
	@ManyToOne()
	private Question question;
	
}
