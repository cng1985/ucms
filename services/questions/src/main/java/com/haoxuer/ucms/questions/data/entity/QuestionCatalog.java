package com.haoxuer.ucms.questions.data.entity;

import com.haoxuer.discover.data.entity.CatalogEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "question_catalog")
public class QuestionCatalog extends CatalogEntity {

	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY)
	private List<QuestionCatalog> childrens;

	private String icon;

	
	@JoinColumn(name = "pid")
	@ManyToOne(fetch = FetchType.LAZY)
	private QuestionCatalog parent;
	/**
	 * 数量
	 */
	private Long nums;
	
	@Override
	public Integer getParentId() {
		if (parent != null) {
			return parent.getId();
		} else {
			return null;
		}
	}

	

}
