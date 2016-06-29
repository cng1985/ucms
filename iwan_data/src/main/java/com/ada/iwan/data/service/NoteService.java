package com.ada.iwan.data.service;

import com.ada.iwan.data.entity.Note;
import com.ada.data.page.Filter;
import com.ada.data.page.Order;
import com.ada.data.page.Page;
import com.ada.data.page.Pageable;
import java.util.List;

import com.openyelp.annotation.RestFul;

@RestFul(api=NoteService.class,value="NoteService")
public interface NoteService {

	public Note findById(Long id);

	public Note save(Note bean);

	public Note update(Note bean);

	public Note deleteById(Long id);
	
	public Note[] deleteByIds(Long[] ids);
	
	public Page<Note> findPage(Pageable pageable);

	public long count(Filter... filters);

	public List<Note> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
	
}