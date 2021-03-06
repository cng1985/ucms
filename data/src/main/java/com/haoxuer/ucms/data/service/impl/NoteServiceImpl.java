package com.haoxuer.ucms.data.service.impl;

import java.util.List;

import com.haoxuer.discover.site.data.dao.SystemVersionDao;
import com.haoxuer.ucms.data.dao.NoteDao;
import com.haoxuer.ucms.data.entity.Note;
import com.haoxuer.ucms.data.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;

@Service
@Transactional
public class NoteServiceImpl implements NoteService {

	@Autowired
	private SystemVersionDao versionDao;

	@Transactional(readOnly = true)
	public Note findById(Long id) {

		Note entity = dao.findById(id);

		return entity;
	}

	@Transactional
	public Note save(Note bean) {
		String sequence = Note.class.getSimpleName().toLowerCase();
		Long version = versionDao.next(sequence);
		bean.setVersionNum(version);
		bean.setState(1);
		dao.save(bean);
		return bean;
	}

	@Transactional
	public Note update(Note bean) {
		String sequence = Note.class.getSimpleName().toLowerCase();
		Long version = versionDao.next(sequence);
		bean.setVersionNum(version);
		bean.setState(2);
		Updater<Note> updater = new Updater<Note>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

	@Transactional
	public Note deleteById(Long id) {

		Note bean = dao.findById(id);
		String sequence = Note.class.getSimpleName().toLowerCase();
		Long version = versionDao.next(sequence);
		bean.setVersionNum(version);
		bean.setState(3);

		return bean;
	}

	@Transactional
	public Note[] deleteByIds(Long[] ids) {
		Note[] beans = new Note[ids.length];
		for (int i = 0, len = ids.length; i < len; i++) {
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
	public Page<Note> findPage(Pageable pageable) {
		return dao.findPage(pageable);
	}

	@Transactional(readOnly = true)
	public long count(Filter... filters) {

		return dao.count(filters);

	}

	@Transactional(readOnly = true)
	public List<Note> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders) {

		return dao.findList(first, count, filters, orders);

	}
}