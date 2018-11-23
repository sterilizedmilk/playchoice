package com.playchoice.payment.dao;

import java.util.List;

import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.payment.dto.PaymentSearchDTO;

public interface PaymentDAO {
	
	public PaymentDTO getPayment(int p_id);

	public List<PaymentDTO> searchPayment(PaymentSearchDTO dto);

	public int insertPayment(PaymentDTO dto);

	public boolean isCanceled(int p_id);

	public int insertCancel(PaymentDTO dto);

	public int updateCanceled(int p_id);

}
