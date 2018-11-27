package com.playchoice.review.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.admin.dao.SiteAdminDAO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.payment.dao.PaymentDAO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dao.ReviewDAO;
import com.playchoice.review.dto.ReviewDTO;
import com.playchoice.schedule.dao.ScheduleDAO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDAO dao;
	
//	@Autowired
//	SiteAdminDAO siteAdminDao;
	@Autowired
	PaymentDAO paymentDao;
	@Autowired
	ScheduleDAO scheduleDao;
	
	@Override
	public List<Object> getTotalReview(int p_id) {
		// TODO Auto-generated method stub
		return dao.getTotalReview(p_id);
	}
	
	//(리뷰작성시)배우정보 가져오기
	@Override
	public List<ActorDTO> actorInfo(PaymentDTO dto) {
		// TODO Auto-generated method stub
		return dao.actorInfo(dto);
	}

	@Override
	public int regReview(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return dao.regReview(dto);
	}

	@Override
	public boolean canWriteReview(int m_code, int p_id) { // member, payment id
//		MemberDTO member = siteAdminDao.getMember(m_code);
		PaymentDTO payment = paymentDao.getPayment(p_id);
		ScheduleDTO schedule = scheduleDao.getSchedule(payment.getS_id());
		ReviewDTO review = dao.getReview(m_code, schedule.getS_id());
		
		if (review != null)
			return false;
		
		// 자기 결제 || 취소 여부 || 취소하는 결제인지 여부
		if (payment.getM_code() != m_code || payment.getP_canceled() == 1 || payment.getP_cancel_target_id() != 0)
			return false;
		
		// 연극 일정과 지금 시간 비교
		if (schedule.getS_time().after(new Date()))
			return false;
		
		// 7일 전 비교
		if (schedule.getS_time().getTime() - (new Date()).getTime() > 1000 * 60 * 60 * 24 * 7)
			return false;
		
		return true;
	}
	
}
