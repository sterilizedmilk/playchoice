package com.playchoice.article.dao;

import com.playchoice.article.dto.ArticleDTO;
import com.playchoice.article.dto.ReplyDTO;

public interface ArticleDAO {

	public Object list(String a_target);

	public Object listContactAdmin(String a_target);

	public Object list(ArticleDTO dto);

	public Object insertOne(ArticleDTO dto);

	public Object selectOne(Integer a_id);

	public Object deleteOne(ArticleDTO dto);

	public Object modifyOne(ArticleDTO dto);

	public Object commentOne(ReplyDTO dto);

	// 게시글 수 구하기
	public Object listCount(String a_target);

	// // 페이징 처리를 위한 메서드
	// public Object listCriteria(Criteria cri) throws Exception;

	// 게시판 댓글 리스트 불러오는 거 만들기
	public Object Replylist(ArticleDTO dto);

}
