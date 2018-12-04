package com.playchoice.play.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.play.dao.PlayDAOImpl;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayMenuDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class PlayServiceImpl implements PlayService {

	public PlayServiceImpl() {
	}

	@Autowired
	private PlayDAOImpl playDao;

	@Override
	public List<PlayDTO> playList() throws Exception {

		return playDao.playList();
	}

	@Override
	public List<PlayDTO> playList(PlayMenuDTO menudto) {
		// TODO Auto-generated method stub
		return playDao.playList(menudto);
	}

	@Override
	public PlayDTO playDetail(int p_id) throws Exception {

		return playDao.playDetail(p_id);
	}

	@Override
	public List<ScheduleDTO> viewCal(HashMap<String, Object> param) {
		// TODO 안쓰면 삭제해야함
		return playDao.viewCal(param);
	}

	@Override
	public List<ScheduleDTO> getSchedule(int p_id) {

		return playDao.getSchedule(p_id);

	}

	@Override
	public Object getReviewSmall(int p_id) {

		return playDao.getReviewSmall(p_id);
	}
	
	@Override
	public List<Object> getReviewList(int p_id,PageDTO pdto) {
		
		List res = playDao.getReviewList(p_id, pdto);
	
		return res;
	}

	@Override
	public Object getReviewScore(int p_id) {

		return playDao.getReviewScore(p_id);
	}

	@Override
	public List<Object> getQnA(int p_id) {
		List<Object> list = new ArrayList<>();
		list = (ArrayList) playDao.getQnA(p_id);

		// 연극관리자는 노출되는 아이디가 연극관리자로 변경
		for (Object res : list) {
			if (res instanceof HashMap) {
				HashMap<String, Object> test = (HashMap) res;

				if (!test.get("m_level").equals(0)) {
					test.put("m_id", "연극관리자");
				}
			}
		}
		return list;
	}

	@Override
	public Object RankList() {
		// TODO Auto-generated method stub
		return playDao.getPlayRank();
	}

	@Override
	public Object SearchList(String search) {
		return playDao.getSearchList(search);
	}

	// 오늘,내일 리스트
	@Override
	public List<PlayDTO> playTodayList(PlayMenuDTO dto) {
		// TODO Auto-generated method stub
		return playDao.playTodayList(dto);
	}

	// 지역 리스트
	@Override
	public List<AreaDTO> getAreaList() {
		// TODO Auto-generated method stub
		return playDao.getAreaList();
	}

	// 장르
	@Override
	public List<GenreDTO> getGenreList() {
		// TODO Auto-generated method stub
		return playDao.getGenreList();
	}

	@Override
	public List<PlayDTO> playTodayList(String date) {
		// TODO Auto-generated method stub
		return null;
	}

}
