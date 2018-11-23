package com.playchoice.payment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.payment.dto.PaymentSearchDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate session;
	private final String namespace = "com.playchoice.mappers.paymentMapper";

	@Override
	public PaymentDTO getPayment(int p_id) {
		return session.selectOne(namespace + ".getPayment", p_id);
	}

	@Override
	public List<PaymentDTO> searchPayment(PaymentSearchDTO dto) {
		return session.selectList(namespace + ".searchPayment", dto);
	}

	@Override
	public int insertPayment(PaymentDTO dto) {
		System.out.println(session);
		return session.insert(namespace + ".insertPayment", dto);
	}

	@Override
	public boolean isCanceled(int p_id) {
		return ((Integer) session.selectOne(namespace + ".isCanceled", p_id)) == 1;
	}

	@Override
	public int insertCancel(PaymentDTO dto) {
		return session.insert(namespace + ".insertCancel", dto);
	}

	@Override
	public int updateCanceled(int p_id) {
		return session.update(namespace + ".updateCanceled", p_id);
	}

}
