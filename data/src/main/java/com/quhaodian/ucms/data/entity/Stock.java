package com.quhaodian.ucms.data.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.haoxuer.discover.data.annotations.ColType;
import com.haoxuer.discover.data.annotations.FormAnnotation;
import com.haoxuer.discover.data.annotations.FormFieldAnnotation;
import com.haoxuer.discover.data.entity.AbstractEntity;

/**
 * "code": 代码 "name": 名称 "industry": 所属行业 "area": 地区 "pe": 市盈率 "outstanding":
 * 流通股本 "totals": 总股本(万) "totalassets": 总资产(万) "liquidassets": 流动资产
 * "fixedassets": 固定资产 "reserved": 公积金 "reservedpershare":每股公积金 "eps": 每股收益
 * "bvps": 每股净资 "pb": 市净率 "timetomarket": 上市日期
 */

@FormAnnotation(title = "股票", add = "添加股票", list = "股票", update = "更新股票")
@Entity
@Table(name = "stock")
public class Stock extends AbstractEntity {


	@ManyToOne
	private StockCatalog catalog;

	/**
	 * 地区
	 */
	@FormFieldAnnotation(title = "地区", sortNum = "5", grid = true, col = ColType.col_1)
	private String area;

	/**
	 * 每股净资
	 */
	private float bvps;

	@FormFieldAnnotation(title = "当前价格", sortNum = "3", grid = true, col = ColType.col_1)
	private BigDecimal price;// 27.34, //当前价格
	/**
	 * 代码
	 */
	@Column(length = 8,unique = true)
	@FormFieldAnnotation(title = "代码", sortNum = "2", grid = true, col = ColType.col_2)
	private String code;
	
	/**
	 * 每股收益
	 */
	@FormFieldAnnotation(title = "每股收益", sortNum = "5", grid = true, col = ColType.col_1)
	private float eps;


	/**
	 * 固定资产
	 */
	@FormFieldAnnotation(title = "固定资产", sortNum = "5", grid = true, col = ColType.col_1)
	private float fixedassets;

	/**
	 * 所属行业
	 */
	@FormFieldAnnotation(title = "所属行业", sortNum = "6", grid = true, col = ColType.col_1)
	private String industry;

	/**
	 * 流动资产
	 */
	private float liquidassets;

	/**
	 * 名称
	 */
	@FormFieldAnnotation(title = "名称", sortNum = "1", grid = true, col = ColType.col_1)
	private String name;

	/**
	 * 流通股本
	 */
	@FormFieldAnnotation(title = "流通股本", sortNum = "21", grid = true, col = ColType.col_1)
	private float outstanding;

	/**
	 * 市净率
	 */
	@FormFieldAnnotation(title = "市净率", sortNum = "11", grid = true, col = ColType.col_1)
	private float pb;

	/**
	 * 市盈率
	 */
	@FormFieldAnnotation(title = "市盈率", sortNum = "2", grid = true, col = ColType.col_1)
	private float pe;

	private String pinyin;

	private String pinyinHead;

	/**
	 * 公积金
	 */
	@FormFieldAnnotation(title = "公积金", sortNum = "3", grid = true, col = ColType.col_1)
	private float reserved;

	/**
	 * 每股公积金
	 */
	private float reservedpershare;

	/**
	 * 上市日期
	 */
	private Date timetomarket;

	/**
	 * 总资产(万)
	 */
	private float totalassets;

	/**
	 * 总股本(万)
	 */
	private float totals;

	public String getArea() {
		return area;
	}

	public float getBvps() {
		return bvps;
	}

	public StockCatalog getCatalog() {
		return catalog;
	}

	public String getCode() {
		return code;
	}

	public float getEps() {
		return eps;
	}

	public float getFixedassets() {
		return fixedassets;
	}

	public String getGif() {

		if (code.startsWith("6")) {
			return "sh" + code;
		} else if (code.startsWith("3")) {
			return "sz" + code;
		} else if (code.startsWith("0")) {
			return "sz" + code;
		}
		return "sz" + code;
	}

	public String getIndustry() {
		return industry;
	}

	public float getLiquidassets() {
		return liquidassets;
	}

	public String getName() {
		return name;
	}

	public float getOutstanding() {
		return outstanding;
	}

	public float getPb() {
		return pb;
	}

	public float getPe() {
		return pe;
	}

	public String getPinyin() {
		return pinyin;
	}

	public String getPinyinHead() {
		return pinyinHead;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public float getReserved() {
		return reserved;
	}

	public float getReservedpershare() {
		return reservedpershare;
	}

	public Date getTimetomarket() {
		return timetomarket;
	}

	public float getTotalassets() {
		return totalassets;
	}

	public float getTotals() {
		return totals;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setBvps(float bvps) {
		this.bvps = bvps;
	}

	public void setCatalog(StockCatalog catalog) {
		this.catalog = catalog;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setEps(float eps) {
		this.eps = eps;
	}

	public void setFixedassets(float fixedassets) {
		this.fixedassets = fixedassets;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public void setLiquidassets(float liquidassets) {
		this.liquidassets = liquidassets;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setOutstanding(float outstanding) {
		this.outstanding = outstanding;
	}

	public void setPb(float pb) {
		this.pb = pb;
	}

	public void setPe(float pe) {
		this.pe = pe;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public void setPinyinHead(String pinyinHead) {
		this.pinyinHead = pinyinHead;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public void setReserved(float reserved) {
		this.reserved = reserved;
	}

	public void setReservedpershare(float reservedpershare) {
		this.reservedpershare = reservedpershare;
	}

	public void setTimetomarket(Date timetomarket) {
		this.timetomarket = timetomarket;
	}

	public void setTotalassets(float totalassets) {
		this.totalassets = totalassets;
	}

	public void setTotals(float totals) {
		this.totals = totals;
	}

	@Override
	public String toString() {
		return "StockInfo [code=" + code + ", name=" + name + ", industry=" + industry + ", area=" + area + ", pe=" + pe
				+ ", outstanding=" + outstanding + ", totals=" + totals + ", totalassets=" + totalassets
				+ ", liquidassets=" + liquidassets + ", fixedassets=" + fixedassets + ", reserved=" + reserved
				+ ", reservedpershare=" + reservedpershare + ", eps=" + eps + ", bvps=" + bvps + ", pb=" + pb
				+ ", timetomarket=" + timetomarket + "]";
	}

}
