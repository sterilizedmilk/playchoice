package com.playchoice.play.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.play.dao.PlayDAOImpl;
import com.playchoice.play.dto.PlayDTO;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	private PlayDAOImpl playDao;

	@Override
	public List<PlayDTO> playList() throws Exception {

		return playDao.playList();
	}

	@Override
	public PlayDTO playDetail(int p_id) throws Exception {

		return playDao.playDetail(p_id);
	}

	@Override
	public List<Object> viewCal(HashMap<String, Object> param) {
		// TODO 안쓰면 삭제해야함
		System.out.println("viewCal 서비스왓다");
		return playDao.viewCal(param);
	}

	@Override
	public Object getSchedule(int p_id) {

		return playDao.getSchedule(p_id);

	}

	@Override
	public Object getReviewSmall(int p_id) {

		return playDao.getReviewSmall(p_id);
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

				if (!test.get("m_level").equals(1)) {
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

	// 오늘,내일 리스트
	@Override
	public List<PlayDTO> playTodayList(String date) {
		// TODO Auto-generated method stub
		return playDao.playTodayList(date);
	}

}
