package com.playchoice.article.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.playchoice.article.dto.ArticleDTO;

@Transactional
@Service
public class CustomerCenterDAO implements ArticleDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Object list(String a_target) {
		// TODO Auto-generated method stub
		System.out.println(sqlSessionTemplate.selectList("article.list", a_target));
		return sqlSessionTemplate.selectList("article.list", a_target);
	}

	@Override
	public Object insertOne(ArticleDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("article.insertOne", dto);
	}

	@Override
	public Object deleteOne(ArticleDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("article.deleteOne", dto);
	}

	@Override
	public Object modifyOne(ArticleDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("article.modifyOne", dto);
	}

	public Object selectOne(Object a_id) {
		// TODO Auto-generated method stub
		System.out.println("selectOne" + (Integer) a_id);
		return sqlSessionTemplate.selectOne("article.selectOne", (Integer) a_id);
	}

}
