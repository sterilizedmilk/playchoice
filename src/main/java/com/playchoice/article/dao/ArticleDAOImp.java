package com.playchoice.article.dao;

import java.util.List;

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
		List<ArticleDTO> list = sqlSessionTemplate.selectList("article.list", a_target);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setM_id(userInfo(list.get(i).getM_code()));
		}
		return list;
	}

	@Override
	public Object list(ArticleDTO dto) {
		// TODO Auto-generated method stub
		List<ArticleDTO> list;
		if (dto.getM_level() != null && dto.getM_level().equals(2))
			list = sqlSessionTemplate.selectList("article.contactAlllist", dto);
		else
			list = sqlSessionTemplate.selectList("article.userlist", dto);

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setM_id(userInfo(list.get(i).getM_code()));
		}
		return list;
	}

	public String userInfoID(Integer m_code) {
		return sqlSessionTemplate.selectOne("article.userInfoID", m_code);
	}

	public String userInfoLevel(Integer m_code) {
		return sqlSessionTemplate.selectOne("article.userInfoLevel", m_code);
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
		dto.setM_id(userInfo(dto.getM_code()));
		return dto;
	}

	@Override
	public Object Replylist(ArticleDTO dto) {
		// TODO Auto-generated method stub
		List<ReplyDTO> list = sqlSessionTemplate.selectList("article.replylist", dto);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setM_id(userInfoID(list.get(i).getM_code()));
			list.get(i).setM_level(userInfoLevel(list.get(i).getM_code()));
		}
		return list;
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
		sqlSessionTemplate.update("article.commentUpdate", dto);
		return obj;
	}

	@Override
	public String userInfo(Integer m_code) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("article.userInfoID", m_code);
	}

	// @Override
	// public Object listCriteria(Criteria cri) throws Exception {
	// // TODO Auto-generated method stub
	// return sqlSessionTemplate.selectList("article.list", cri);
	// }
}
