package com.playchoice.article.dao;


import com.playchoice.article.dto.ArticleDTO;

public interface ArticleDAO {

	public Object list(String a_target);

	public Object insertOne(ArticleDTO dto);

	public Object selectOne(Object a_id);

	public Object deleteOne(ArticleDTO dto);

	public Object modifyOne(ArticleDTO dto);
}
