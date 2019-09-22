package com.haoxuer.ucms.data.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.haoxuer.discover.data.entity.CatalogEntity;

/**
 * 股票分类
 * 
 * @author cng19
 *
 */
@Entity
@Table(name = "stock_catalog")
public class StockCatalog extends CatalogEntity {

	@ManyToOne
	@JoinColumn(name = "pid")
	private StockCatalog parent;

	public Integer getParentId() {
		if (parent != null) {
			return parent.getId();
		} else {
			return null;
		}
	}

	public StockCatalog getParent() {
		return parent;
	}

	public void setParent(StockCatalog parent) {
		this.parent = parent;
	}

}
