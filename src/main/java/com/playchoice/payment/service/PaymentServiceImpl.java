package com.playchoice.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.payment.dao.PaymentDAO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.payment.dto.PaymentSearchDTO;
import com.playchoice.schedule.dao.ScheduleDAO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDAO dao;

	@Autowired
	ScheduleDAO scheduleDao;

	@Override
	public PaymentDTO getPayment(int p_id) {
		return dao.getPayment(p_id);
	}
	
	@Override
	public int paymentCount(PaymentSearchDTO dto) {
		return dao.paymentCount(dto);
	}
	
	public List<PaymentDTO> searchPayment(PaymentSearchDTO dto) {
		return dao.searchPayment(dto);
	}

	@Override
	public int insertPayment(PaymentDTO dto) {
		return dao.insertPayment(dto);
	}

	@Override
	public int refund(PaymentDTO dto) {
		ScheduleDTO schedule = scheduleDao.getSchedule(dto.getS_id());

		long showDay = schedule.getS_time().getTime() / 86400000;
		long today = System.currentTimeMillis() / 86400000;
		long payDay = dto.getP_time().getTime() / 86400000;
		int diff = (int) (showDay - today);

		if (dto.getP_canceled() == 1 || diff <= 0 || dto.getP_cancel_target_id() != 0)
			return 0; // 환불 불가

		int refund = 0;
		if (payDay == today && diff != 0 || diff >= 7) {
			refund = -dto.getP_price();
		} else if (diff >= 4) {
			refund = -dto.getP_price() * 90 / 100;
		} else if (diff >= 2) {
			refund = -dto.getP_price() * 80 / 100;
		} else if (diff == 1) {
			refund = -dto.getP_price() * 70 / 100;
		}

		return refund;
	}

	/**
	 * @return refund
	 */
	@Override
	public PaymentDTO cancelPayment(PaymentDTO dto) {
		PaymentDTO cancel = dto.cancel();
		cancel.setP_price(refund(dto));

		dao.updateCanceled(dto.getP_id());
		dao.insertCancel(cancel);
		return cancel;
	}

	@Override
	public List<PaymentDTO> paymentList() {
		// TODO Auto-generated method stub
		return null;
	}

}
