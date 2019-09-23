package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.data.entity.AbstractEntity;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 问题分词
 * 
 * @author ada
 *
 */
@Data
@Entity
@Table(name = "question_word")
public class QuestionWord extends AbstractEntity {
	/**
	 * 词语
	 */
	private String word;

	/**
	 * 标题数量
	 */
	@Column(name = "titlecount")
	private Integer titleCount;

	/**
	 * 内容数量
	 */
	@Column(name = "contentcount")
	private Integer contentCount;

	/**
	 * 标签数量
	 */
	@Column(name = "tagwordcount")
	private Integer tagwordCount;

	/**
	 * 标签数量
	 */
	@Column(name = "tagcount")
	private Integer tagCount;


}
