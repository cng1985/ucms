package com.quhaodian.ucms.data.dao.impl;

import com.quhaodian.ucms.data.dao.NoteDao;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.quhaodian.data.core.CriteriaDaoImpl;
import com.quhaodian.data.core.Pagination;
import com.quhaodian.ucms.data.dao.NoteDao;
import com.quhaodian.ucms.data.entity.Note;

@Repository
public class NoteDaoImpl extends CriteriaDaoImpl<Note, Long> implements NoteDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public Note findById(Long id) {
	    if (id==null) {
			return null;
		}
		Note entity = get(id);
		return entity;
	}

	public Note save(Note bean) {
		getSession().save(bean);
		
		
		return bean;
	}

	public Note deleteById(Long id) {
		Note entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<Note> getEntityClass() {
		return Note.class;
	}
	
	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
}