package com.ada.ucms.data.entity;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ada.data.entity.AbstractEntity;

/**
 * 股票每天多次记录
 * 
 * @author cng19
 *
 */
@Entity
@Table(name = "stock_day")
public class StockDay extends AbstractEntity {

	@ManyToOne
	private Stock stock;
	private String name;// : "sz002230", //股票代码，SZ指在深圳交易的股票
	private String code;// : "sz002230", //股票代码，SZ指在深圳交易的股票
	private String date;// : "2014-09-22", //当前显示股票信息的日期
	private String time;// : "09:26:11", //具体时间
	private BigDecimal OpenningPrice;// : 27.34, //今日开盘价
	private BigDecimal closingPrice;// 27.34, //昨日收盘价
	private BigDecimal currentPrice;// 27.34, //当前价格
	private BigDecimal hPrice;// 27.34, //今日最高价
	private BigDecimal lPrice;// 27.34, //今日最低价
	private BigDecimal competitivePrice;// 27.30, //买一报价
	private BigDecimal auctionPrice;// 27.34, //卖一报价
	private BigDecimal totalNumber;// 47800, //成交的股票数
	private BigDecimal turnover;// 1306852.00, //成交额，以元为单位
	private BigDecimal buyOne;// 6100, //买一
	private BigDecimal buyOnePrice;// 27.30, //买一价格
	private BigDecimal buyTwo;// 7500, //买二
	private BigDecimal buyTwoPrice;// 27.29, //买二价格
	private BigDecimal buyThree;// 2000, //买三
	private BigDecimal buyThreePrice;// 27.27, //买三价格
	private BigDecimal buyFour;// 100, //买四
	private BigDecimal buyFourPrice;// 27.25, //买四价格
	private BigDecimal buyFive;// 5700, //买五
	private BigDecimal buyFivePrice;// 27.22, //买五价格
	private BigDecimal sellOne;// 10150, //卖一
	private BigDecimal sellOnePrice;// 27.34, //卖一价格
	private BigDecimal sellTwo;// 15200, //卖二
	private BigDecimal sellTwoPrice;// 27.35, //卖二价格
	private BigDecimal sellThree;// 5914, //卖三
	private BigDecimal sellThreePrice;// 27.36, //卖三价格
	private BigDecimal sellFour;// 400, //卖四
	private BigDecimal sellFourPrice;// 27.37, //卖四价格
	private BigDecimal sellFive;// 3000, //卖五
	private BigDecimal sellFivePrice;// 27.38 //卖五价格

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public BigDecimal getOpenningPrice() {
		return OpenningPrice;
	}

	public void setOpenningPrice(BigDecimal openningPrice) {
		OpenningPrice = openningPrice;
	}

	public BigDecimal getClosingPrice() {
		return closingPrice;
	}

	public void setClosingPrice(BigDecimal closingPrice) {
		this.closingPrice = closingPrice;
	}

	public BigDecimal getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(BigDecimal currentPrice) {
		this.currentPrice = currentPrice;
	}

	public BigDecimal gethPrice() {
		return hPrice;
	}

	public void sethPrice(BigDecimal hPrice) {
		this.hPrice = hPrice;
	}

	public BigDecimal getlPrice() {
		return lPrice;
	}

	public void setlPrice(BigDecimal lPrice) {
		this.lPrice = lPrice;
	}

	public BigDecimal getCompetitivePrice() {
		return competitivePrice;
	}

	public void setCompetitivePrice(BigDecimal competitivePrice) {
		this.competitivePrice = competitivePrice;
	}

	public BigDecimal getAuctionPrice() {
		return auctionPrice;
	}

	public void setAuctionPrice(BigDecimal auctionPrice) {
		this.auctionPrice = auctionPrice;
	}

	public BigDecimal getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(BigDecimal totalNumber) {
		this.totalNumber = totalNumber;
	}

	public BigDecimal getTurnover() {
		return turnover;
	}

	public void setTurnover(BigDecimal turnover) {
		this.turnover = turnover;
	}

	public BigDecimal getBuyOne() {
		return buyOne;
	}

	public void setBuyOne(BigDecimal buyOne) {
		this.buyOne = buyOne;
	}

	public BigDecimal getBuyOnePrice() {
		return buyOnePrice;
	}

	public void setBuyOnePrice(BigDecimal buyOnePrice) {
		this.buyOnePrice = buyOnePrice;
	}

	public BigDecimal getBuyTwo() {
		return buyTwo;
	}

	public void setBuyTwo(BigDecimal buyTwo) {
		this.buyTwo = buyTwo;
	}

	public BigDecimal getBuyTwoPrice() {
		return buyTwoPrice;
	}

	public void setBuyTwoPrice(BigDecimal buyTwoPrice) {
		this.buyTwoPrice = buyTwoPrice;
	}

	public BigDecimal getBuyThree() {
		return buyThree;
	}

	public void setBuyThree(BigDecimal buyThree) {
		this.buyThree = buyThree;
	}

	public BigDecimal getBuyThreePrice() {
		return buyThreePrice;
	}

	public void setBuyThreePrice(BigDecimal buyThreePrice) {
		this.buyThreePrice = buyThreePrice;
	}

	public BigDecimal getBuyFour() {
		return buyFour;
	}

	public void setBuyFour(BigDecimal buyFour) {
		this.buyFour = buyFour;
	}

	public BigDecimal getBuyFourPrice() {
		return buyFourPrice;
	}

	public void setBuyFourPrice(BigDecimal buyFourPrice) {
		this.buyFourPrice = buyFourPrice;
	}

	public BigDecimal getBuyFive() {
		return buyFive;
	}

	public void setBuyFive(BigDecimal buyFive) {
		this.buyFive = buyFive;
	}

	public BigDecimal getBuyFivePrice() {
		return buyFivePrice;
	}

	public void setBuyFivePrice(BigDecimal buyFivePrice) {
		this.buyFivePrice = buyFivePrice;
	}

	public BigDecimal getSellOne() {
		return sellOne;
	}

	public void setSellOne(BigDecimal sellOne) {
		this.sellOne = sellOne;
	}

	public BigDecimal getSellOnePrice() {
		return sellOnePrice;
	}

	public void setSellOnePrice(BigDecimal sellOnePrice) {
		this.sellOnePrice = sellOnePrice;
	}

	public BigDecimal getSellTwo() {
		return sellTwo;
	}

	public void setSellTwo(BigDecimal sellTwo) {
		this.sellTwo = sellTwo;
	}

	public BigDecimal getSellTwoPrice() {
		return sellTwoPrice;
	}

	public void setSellTwoPrice(BigDecimal sellTwoPrice) {
		this.sellTwoPrice = sellTwoPrice;
	}

	public BigDecimal getSellThree() {
		return sellThree;
	}

	public void setSellThree(BigDecimal sellThree) {
		this.sellThree = sellThree;
	}

	public BigDecimal getSellThreePrice() {
		return sellThreePrice;
	}

	public void setSellThreePrice(BigDecimal sellThreePrice) {
		this.sellThreePrice = sellThreePrice;
	}

	public BigDecimal getSellFour() {
		return sellFour;
	}

	public void setSellFour(BigDecimal sellFour) {
		this.sellFour = sellFour;
	}

	public BigDecimal getSellFourPrice() {
		return sellFourPrice;
	}

	public void setSellFourPrice(BigDecimal sellFourPrice) {
		this.sellFourPrice = sellFourPrice;
	}

	public BigDecimal getSellFive() {
		return sellFive;
	}

	public void setSellFive(BigDecimal sellFive) {
		this.sellFive = sellFive;
	}

	public BigDecimal getSellFivePrice() {
		return sellFivePrice;
	}

	public void setSellFivePrice(BigDecimal sellFivePrice) {
		this.sellFivePrice = sellFivePrice;
	}

	@Override
	public String toString() {
		return "StockDetail [stock=" + stock + ", name=" + name + ", code=" + code + ", date=" + date + ", time=" + time
				+ ", OpenningPrice=" + OpenningPrice + ", closingPrice=" + closingPrice + ", currentPrice="
				+ currentPrice + ", hPrice=" + hPrice + ", lPrice=" + lPrice + ", competitivePrice=" + competitivePrice
				+ ", auctionPrice=" + auctionPrice + ", totalNumber=" + totalNumber + ", turnover=" + turnover
				+ ", buyOne=" + buyOne + ", buyOnePrice=" + buyOnePrice + ", buyTwo=" + buyTwo + ", buyTwoPrice="
				+ buyTwoPrice + ", buyThree=" + buyThree + ", buyThreePrice=" + buyThreePrice + ", buyFour=" + buyFour
				+ ", buyFourPrice=" + buyFourPrice + ", buyFive=" + buyFive + ", buyFivePrice=" + buyFivePrice
				+ ", sellOne=" + sellOne + ", sellOnePrice=" + sellOnePrice + ", sellTwo=" + sellTwo + ", sellTwoPrice="
				+ sellTwoPrice + ", sellThree=" + sellThree + ", sellThreePrice=" + sellThreePrice + ", sellFour="
				+ sellFour + ", sellFourPrice=" + sellFourPrice + ", sellFive=" + sellFive + ", sellFivePrice="
				+ sellFivePrice + "]";
	}

}
