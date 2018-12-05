package com.playchoice.play.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayMenuDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Repository
public class PlayDAOImpl implements PlayDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mappers.playMapper"; // config 파일 설정해놓지않으면 풀네임을 써야한다

	@Override
	public List<PlayDTO> playList() {
		List<PlayDTO> dto = sqlSession.selectList(namespace + ".playList");
		return dto;
	}

	@Override
	public List<PlayDTO> playList(PlayMenuDTO menudto) {
		// TODO Auto-generated method stub
		List<PlayDTO> dto = sqlSession.selectList(namespace + ".playListFilter", menudto);
		return dto;
	}

	@Override
	public PlayDTO playDetail(int p_id) { // detail

		return sqlSession.selectOne(namespace + ".playDetail", p_id);
	}

	@Override
	public int playAdd(PlayDTO dto) {
		return 0;
	}

	@Override
	public int playPost(int p_id) {
		return 0;
	}

	@Override
	public int playDetach(int p_id) {
		return 0;
	}

	@Override
	public List<ScheduleDTO> viewCal(HashMap<String, Object> param) {
		List<ScheduleDTO> res = new ArrayList<ScheduleDTO>();

		res = sqlSession.selectList(namespace + ".viewCal", param);
		System.out.println(res);

		return res;
	}

	@Override
	public List<ScheduleDTO> getSchedule(int p_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".viewCal", p_id);
	}

	@Override
	public Object getReviewSmall(int p_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getReviewSmall", p_id);
	}
	
	// 리뷰 페이징
	@Override
	public List<Object> getReviewList(int p_id, PageDTO pdto) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_id", p_id);
		map.put("pageDTO", pdto);
		return sqlSession.selectList(namespace + ".getReviewList", map);
	}
	

	@Override
	public Object getReviewScore(int p_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getReviewScore", p_id);
	}
	
	//QnA 질문 리스트 
	@Override
	public List<QnaDTO> QeusetionList(int p_id, PageDTO pdto) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_id", p_id);
		map.put("pageDTO", pdto);
		return sqlSession.selectList(namespace + ".QuestionList", map);
	}
	
	@Override
	public List<QnaDTO> AnswerList(int p_id, List<Integer> q_id_list){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_id", p_id);
		map.put("q_id_list", q_id_list);
		
		return sqlSession.selectList(namespace + ".AnswerList", map);
		
	}
	
	//QnA 질문 개수
	@Override
	public int QnaCnt(int p_id) {
	
		return sqlSession.selectOne(namespace+".QnaCnt", p_id);
	}

	@Override
	public Object getPlayRank() {
		// TODO Auto-generated method stub
		List<PlayDTO> dto = sqlSession.selectList(namespace + ".playRankList");
		int p_id = 0;
		for (int i = 0; i < dto.size(); i++) {
			p_id = dto.get(i).getP_id();

			dto.get(i).setLowest_price(sqlSession.selectOne(namespace + ".playPrice", p_id));
		}
		return dto;
	}
	
	@Override
	public Object getSearchList(String search) {
		// TODO Auto-generated method stub
		List<PlayDTO> dto = sqlSession.selectList(namespace + ".playSearchList", search);
		return dto;
	}

	// 오늘,내일 연극
	@Override
	public List<PlayDTO> playTodayList(PlayMenuDTO menudto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".playTodayList", menudto);
	}

	@Override
	public List<AreaDTO> getAreaList() {
		// TODO Auto-generated method stub
		List<AreaDTO> dto = sqlSession.selectList(namespace + ".arealist");
		return dto;
	}

	@Override
	public List<GenreDTO> getGenreList() {
		// TODO Auto-generated method stub
		List<GenreDTO> dto = sqlSession.selectList(namespace + ".genrelist");
		return dto;
	}
}
