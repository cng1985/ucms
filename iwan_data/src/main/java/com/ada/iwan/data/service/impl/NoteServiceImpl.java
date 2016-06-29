package com.ada.iwan.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ada.data.core.Finder;
import com.ada.data.core.Pagination;
import com.ada.data.core.Updater;
import com.ada.iwan.data.dao.NoteDao;
import com.ada.iwan.data.entity.Note;
import com.ada.iwan.data.service.NoteService;

import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import java.util.List;


@Service
@Transactional
public class NoteServiceImpl implements NoteService {
	

	@Transactional(readOnly = true)
	public Note findById(Long id) {
		Note entity = dao.findById(id);
		return entity;
	}

    @Transactional
	public Note save(Note bean) {
		dao.save(bean);
		return bean;
	}

    @Transactional
	public Note update(Note bean) {
		Updater<Note> updater = new Updater<Note>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

    @Transactional
	public Note deleteById(Long id) {
		Note bean = dao.deleteById(id);
		return bean;
	}

    @Transactional	
	public Note[] deleteByIds(Long[] ids) {
		Note[] beans = new Note[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private NoteDao dao;

	@Autowired
	public void setDao(NoteDao dao) {
		this.dao = dao;
	}
	
	
	@Transactional(readOnly = true)
	public Page<Note> findPage(Pageable pageable){
	     return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters){
	     
	     return dao.count(filters);
	     
	}

	@Transactional(readOnly = true)
	public List<Note> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders){
	
		     return dao.findList(first,count,filters,orders);
	
	}
}