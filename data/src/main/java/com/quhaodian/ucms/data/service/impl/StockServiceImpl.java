package com.quhaodian.ucms.data.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quhaodian.data.core.Finder;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.data.core.Updater;
import com.quhaodian.data.page.Filter;
import com.quhaodian.data.page.Order;
import com.quhaodian.data.page.Page;
import com.quhaodian.data.page.Pageable;
import com.quhaodian.ucms.data.dao.StockCatalogDao;
import com.quhaodian.ucms.data.dao.StockDao;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.entity.StockCatalog;
import com.quhaodian.ucms.data.service.StockService;
import com.quhaodian.ucms.service.stock.apps.Pinyin4jUtil;

@Service
@Transactional
public class StockServiceImpl implements StockService {

	@Transactional(readOnly = true)
	public Stock findById(Long id) {
		Stock entity = dao.findById(id);
		return entity;
	}

	@Transactional
	public Stock save(Stock bean) {
		bean.setPinyin(Pinyin4jUtil.getPinYin(bean.getName()));
		bean.setPinyinHead(Pinyin4jUtil.getPinYinHeadChar(bean.getName()));
		List<Stock> ss = dao.findByProperty("code", bean.getCode());
		if (ss != null && ss.size() > 0) {
			Stock s=ss.get(0);
			Long id=s.getId();
			BeanUtils.copyProperties(bean, s);
			s.setId(id);
			
			s.setLastDate(new Date());
		} else {
			
			dao.save(bean);
		}
		return bean;
	}

	@Transactional
	public Stock update(Stock bean) {
		Updater<Stock> updater = new Updater<Stock>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

	@Transactional
	public Stock deleteById(Long id) {
		Stock bean = dao.deleteById(id);
		return bean;
	}

	@Transactional
	public Stock[] deleteByIds(Long[] ids) {
		Stock[] beans = new Stock[ids.length];
		for (int i = 0, len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockDao dao;

	@Autowired
	public void setDao(StockDao dao) {
		this.dao = dao;
	}


	@Transactional(readOnly = true)
	public Page<Stock> findPage(Pageable pageable) {
		return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters) {

		return dao.count(filters);

	}

	@Transactional(readOnly = true)
	public List<Stock> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders) {

		return dao.findList(first, count, filters, orders);

	}

	@Autowired
	StockCatalogDao catalogDao;
	
	@Transactional
	public int updates() {
		Finder finder = Finder.create();
		finder.append("from Stock f ");
		finder.append(" order by f.id desc  ");
		Pagination<Stock> page = dao.find(finder, 1, 10000);
		List<Stock> ss=page.getList();
		if (ss!=null) {
			for (Stock stock : ss) {
				StockCatalog c=catalogDao.findBName(stock.getIndustry());
				if (c==null) {
					c=new StockCatalog();
					StockCatalog parent=new StockCatalog();
					parent.setId(1);
					c.setParent(parent);
					c.setName(stock.getIndustry());
					catalogDao.save(c);
					stock.setCatalog(c);
				}else{
					stock.setCatalog(c);
				}
			}
		}
		
		
		return 0;
	}

	@Transactional(readOnly = true)
	public Stock findByCode(String code) {
		Finder finder = Finder.create();
		finder.append("from Stock s where s.code =:code");
		finder.setParam("code", code);
		List<Stock> ss = dao.find(finder);

		if (ss != null && ss.size() > 0) {
			return ss.get(0);
		} else {
			return null;
		}
	}
}