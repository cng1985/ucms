package com.quhaodian.ucms.data.dao;


import  com.haoxuer.discover.data.core.CriteriaDao;
import  com.haoxuer.discover.data.core.Updater;
import com.haoxuer.discover.data.core.Pagination;
import com.quhaodian.ucms.data.entity.Note;

public interface NoteDao extends CriteriaDao<Note,Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public Note findById(Long id);

	public Note save(Note bean);

	public Note updateByUpdater(Updater<Note> updater);

	public Note deleteById(Long id);
}