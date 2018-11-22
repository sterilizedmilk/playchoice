package com.playchoice.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.member.dao.ShoppingBasketDAO;
import com.playchoice.member.dto.ShoppingBasketDTO;

@Service
public class ShoppingBasketServiceImpl implements ShoppingBasketService {
	
	@Autowired
	private ShoppingBasketDAO shoppingBasketDao;

	// 장바구니 목록
	@Override
	public List<ShoppingBasketDTO> ShoppingBasketList(int m_code) throws Exception {
		return shoppingBasketDao.ShoppingBasketList(m_code);
	}

	// 장바구니 조회
	@Override
	public ShoppingBasketDTO viewBasket(int m_code) throws Exception {
		return shoppingBasketDao.viewBasket(m_code);
	}

	// 장바구니 추가
	@Override
	public void insertBasket(ShoppingBasketDTO dto) throws Exception {
		shoppingBasketDao.insertBasket(dto);
	}

	// 장바구니 수정
	@Override
	public void updateBasket(ShoppingBasketDTO dto) throws Exception {
		shoppingBasketDao.updateBasket(dto);
	}

	// 장바구니 삭제
	@Override
	public void deleteBasket(int p_id) throws Exception {
		shoppingBasketDao.deleteBasket(p_id);
	}

	// 장바구니에 동일한 상품이 있는지 체크
	@Override
	public int checkBasket(int m_code, int p_id) throws Exception {
		return shoppingBasketDao.checkBasket(m_code, p_id);
	}

}
