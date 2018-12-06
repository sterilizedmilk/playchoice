package com.playchoice.payment.service;

import java.util.List;

import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.payment.dto.PaymentSearchDTO;

public interface PaymentService {

	public PaymentDTO getPayment(int p_id);

	public int paymentCount(PaymentSearchDTO dto);

	public List<PaymentDTO> searchPayment(PaymentSearchDTO dto);

	public int insertPayment(PaymentDTO dto);

	public int refund(PaymentDTO dto);
	
	public PaymentDTO cancelPayment(PaymentDTO dto);

	public List<PaymentDTO> paymentList();
}
