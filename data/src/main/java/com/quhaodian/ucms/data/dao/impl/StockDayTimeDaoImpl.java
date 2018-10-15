package com.quhaodian.ucms.data.dao.impl;

import com.haoxuer.discover.data.page.Filter;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haoxuer.discover.data.core.CriteriaDaoImpl;
import com.quhaodian.ucms.data.dao.StockDayTimeDao;
import com.quhaodian.ucms.data.entity.StockDayTime;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by imake on 2018年05月19日21:36:17.
 */
@Repository

public class StockDayTimeDaoImpl extends CriteriaDaoImpl<StockDayTime, Long> implements StockDayTimeDao {

  @Override
  public StockDayTime findById(Long id) {
    if (id == null) {
      return null;
    }
    return get(id);
  }

  @Override
  public StockDayTime findByDay(Long id, String time) {
    List<Filter> filters = new ArrayList<>();
    filters.add(Filter.eq("day.id", id));
    filters.add(Filter.eq("time", time));

    List<StockDayTime> dayTimes = list(0, 2, filters, null);
    if (dayTimes != null && dayTimes.size() > 0) {
      return dayTimes.get(0);
    }
    return null;
  }

  @Override
  public StockDayTime save(StockDayTime bean) {

    getSession().save(bean);


    return bean;
  }

  @Override
  public StockDayTime deleteById(Long id) {
    StockDayTime entity = super.get(id);
    if (entity != null) {
      getSession().delete(entity);
    }
    return entity;
  }

  @Override
  protected Class<StockDayTime> getEntityClass() {
    return StockDayTime.class;
  }

  @Autowired
  public void setSuperSessionFactory(SessionFactory sessionFactory) {
    super.setSessionFactory(sessionFactory);
  }
}