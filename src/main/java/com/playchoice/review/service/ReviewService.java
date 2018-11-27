package com.playchoice.review.service;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dto.ReviewDTO;

public interface ReviewService {
	
	//전체리뷰 갖고오기
	List<Object> getTotalReview(int p_id);

	List<ActorDTO> actorInfo(PaymentDTO dto);

	int regReview(ReviewDTO dto);
	
	
	boolean isReviewExist(int m_code, int s_id);
	
	/**
	 * @param m_code member code
	 * @param p_id payment id
	 */
	boolean canWriteReview(int m_code, int p_id);

}
