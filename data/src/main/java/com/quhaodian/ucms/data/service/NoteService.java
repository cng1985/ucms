package com.quhaodian.ucms.data.service;

import com.haoxuer.discover.data.page.Filter;
import com.haoxuer.discover.data.page.Order;
import com.haoxuer.discover.data.page.Page;
import com.haoxuer.discover.data.page.Pageable;
import com.quhaodian.ucms.data.entity.Note;

import java.util.List;

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