package com.playchoice.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.member.dao.ShoppingBasketDAO;
import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.play.dto.PlayDTO;

@Service
public class ShoppingBasketServiceImpl implements ShoppingBasketService {
	
	@Autowired
	private ShoppingBasketDAO shoppingBasketDao;

	// 장바구니 목록
	@Override
	public List<PlayDTO> shoppingBasketList(int m_code) throws Exception {
		return shoppingBasketDao.shoppingBasketList(m_code);
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
	
	// 장바구니에 동일한 상품이 있는지 검사
	@Override
	public int countBasket(int m_code, int p_id) throws Exception {
		return shoppingBasketDao.countBasket(m_code, p_id);
	}

}
