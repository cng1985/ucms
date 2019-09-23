package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionCatalog;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionCatalogDao extends BaseDao<QuestionCatalog,Integer>{

	 QuestionCatalog findById(Integer id);

	 QuestionCatalog save(QuestionCatalog bean);

	 QuestionCatalog updateByUpdater(Updater<QuestionCatalog> updater);

	 QuestionCatalog deleteById(Integer id);
}