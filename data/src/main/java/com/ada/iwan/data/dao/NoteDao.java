package com.ada.iwan.data.dao;


import  com.ada.data.core.CriteriaDao;
import  com.ada.data.core.Updater;
import com.ada.data.core.Pagination;
import  com.ada.iwan.data.entity.Note;

public interface NoteDao extends CriteriaDao<Note,Long>{
	public Pagination getPage(int pageNo, int pageSize);

	public Note findById(Long id);

	public Note save(Note bean);

	public Note updateByUpdater(Updater<Note> updater);

	public Note deleteById(Long id);
}