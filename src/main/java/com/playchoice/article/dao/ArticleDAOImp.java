package com.playchoice.article.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.playchoice.article.dto.ArticleDTO;
import com.playchoice.article.dto.ReplyDTO;

@Transactional
@Service
public class ArticleDAOImp implements ArticleDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Object list(String a_target) {
		// TODO Auto-generated method stub
		System.out.println("zxcccccccccc");
		return sqlSessionTemplate.selectList("article.list", a_target);
	}

	@Override
	public Object list(ArticleDTO dto) {
		// TODO Auto-generated method stub
		Object obj;
		if (dto.getM_level() != null && dto.getM_level().equals(2))
			obj = sqlSessionTemplate.selectList("article.contactAlllist", dto);
		else
			obj = sqlSessionTemplate.selectList("article.userlist", dto);
		return obj;
	}

	public Object listCount(String a_target) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("article.count", a_target);
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
		System.out.println("modifyOne" + dto);
		return sqlSessionTemplate.update("article.modifyOne", dto);
	}

	public Object selectOne(Integer a_id) {
		// TODO Auto-generated method stub
		ArticleDTO dto = sqlSessionTemplate.selectOne("article.selectOne", a_id);
		return dto;
	}

	@Override
	public Object Replylist(ArticleDTO dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("article.replylist", dto);
	}

	@Override
	public Object listContactAdmin(String a_target) {
		// TODO Auto-generated method stub

		return sqlSessionTemplate.selectList("article.contactAlllist", a_target);
	}

	@Override
	public Object commentOne(ReplyDTO redto, ArticleDTO dto) {
		// TODO Auto-generated method stub
		Object obj = sqlSessionTemplate.insert("article.commentOne", redto);
		System.out.println(dto.getA_id() + "아이디 있냐");
		sqlSessionTemplate.update("article.commentUpdate", dto);
		return obj;
	}

	// @Override
	// public Object listCriteria(Criteria cri) throws Exception {
	// // TODO Auto-generated method stub
	// return sqlSessionTemplate.selectList("article.list", cri);
	// }
}
