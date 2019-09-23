package com.haoxuer.ucms.questions.data.dao;


import  com.haoxuer.discover.data.core.BaseDao;
import  com.haoxuer.discover.data.core.Updater;
import  com.haoxuer.ucms.questions.data.entity.QuestionFavorite;

/**
* Created by imake on 2019年09月23日11:38:26.
*/
public interface QuestionFavoriteDao extends BaseDao<QuestionFavorite,Long>{

	 QuestionFavorite findById(Long id);

	 QuestionFavorite save(QuestionFavorite bean);

	 QuestionFavorite updateByUpdater(Updater<QuestionFavorite> updater);

	 QuestionFavorite deleteById(Long id);
}