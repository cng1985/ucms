package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.config.data.entity.User;
import com.haoxuer.discover.data.entity.AbstractEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "question_points")
public class QuestionPoints extends AbstractEntity {

	@ManyToOne
	private User user;

	private Integer points;
	
	private Integer qposts;
	private Integer aposts;
	private Integer cposts;
	private Integer aselects;
	private Integer aselecteds;
	private Integer qupvotes;
	private Integer qdownvotes;
	private Integer aupvotes;
	private Integer adownvotes;
	private Integer qvoteds;
	private Integer avoteds;
	private Integer upvoteds;
	private Integer downvoteds;
	private Integer bonus;

}
