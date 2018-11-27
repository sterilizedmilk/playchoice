package com.playchoice.review.dao;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dto.ReviewDTO;

public interface ReviewDAO {

	List<Object> getTotalReview(int p_id);

	List<ActorDTO> actorInfo(PaymentDTO dto);
	
	int regReview(ReviewDTO dto);

}
