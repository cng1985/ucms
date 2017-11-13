package com.quhaodian.ucms.data.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.List;

import com.quhaodian.ucms.data.convers.BigDecimalConverter;
import com.quhaodian.ucms.data.dao.StockDao;
import com.quhaodian.ucms.data.dao.StockDayDao;
import com.quhaodian.ucms.data.dao.StockDetailDao;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.entity.StockDay;
import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.ucms.data.service.StockDetailService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
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
import com.quhaodian.ucms.data.convers.BigDecimalConverter;
import com.quhaodian.ucms.data.dao.StockDao;
import com.quhaodian.ucms.data.dao.StockDayDao;
import com.quhaodian.ucms.data.dao.StockDetailDao;
import com.quhaodian.ucms.data.entity.Stock;
import com.quhaodian.ucms.data.entity.StockDay;
import com.quhaodian.ucms.data.entity.StockDetail;
import com.quhaodian.ucms.data.service.StockDetailService;

@Service
@Transactional
public class StockDetailServiceImpl implements StockDetailService {

	@Autowired
	private StockDao stockDao;

	@Autowired
	private StockDayDao stockDayDao;

	@Transactional(readOnly = true)
	public StockDetail findById(Long id) {
		StockDetail entity = dao.findById(id);
		return entity;
	}

	@Transactional
	public StockDetail save(StockDetail bean) {

		Finder finder = Finder.create();
		finder.append("from StockDetail s where s.code =:code");
		finder.setParam("code", bean.getCode());
		finder.append(" and s.date =:date");
		finder.setParam("date", bean.getDate());
		finder.append(" and s.time =:time");
		finder.setParam("time", bean.getTime());
		List<StockDetail> ss = dao.find(finder);
		if (ss != null && ss.size() > 0) {
			ss.get(0).setStock(bean.getStock());
		} else {
			dao.save(bean);
		}
		if (bean.getStock() != null) {
			Stock stock = stockDao.findById(bean.getStock().getId());
			if (stock != null) {
				stock.setPrice(new BigDecimal(bean.getCurrentPrice()));
			}
		}
		StockDay day = stockDayDao.findByCode(bean.getCode(), bean.getDate());
		if (day==null) {
			day=new StockDay();
			
			try {
				ConvertUtils.register(new BigDecimalConverter(), BigDecimal.class);
				BeanUtils.copyProperties(day, bean);
				day.setId(null);
				stockDayDao.save(day);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
		}
		return bean;
	}

	@Transactional
	public StockDetail update(StockDetail bean) {
		Updater<StockDetail> updater = new Updater<StockDetail>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

	@Transactional
	public StockDetail deleteById(Long id) {
		StockDetail bean = dao.deleteById(id);
		return bean;
	}

	@Transactional
	public StockDetail[] deleteByIds(Long[] ids) {
		StockDetail[] beans = new StockDetail[ids.length];
		for (int i = 0, len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private StockDetailDao dao;

	@Autowired
	public void setDao(StockDetailDao dao) {
		this.dao = dao;
	}


	@Transactional(readOnly = true)
	public Page<StockDetail> findPage(Pageable pageable) {
		return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters) {

		return dao.count(filters);

	}

	@Transactional(readOnly = true)
	public List<StockDetail> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders) {

		return dao.findList(first, count, filters, orders);

	}

	@Transactional(readOnly = true)
	public StockDetail findByCode(String code) {
		Finder finder = Finder.create();
		finder.append("from StockDetail s where s.code =:code");
		finder.setParam("code", code);
		List<StockDetail> ss = dao.find(finder);

		if (ss != null && ss.size() > 0) {
			return ss.get(0);
		} else {
			return null;
		}
	}
}