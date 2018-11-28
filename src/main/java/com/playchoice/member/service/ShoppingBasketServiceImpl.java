package com.playchoice.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.common.PageDTO;
import com.playchoice.member.dao.ShoppingBasketDAO;
import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.play.dto.PlayDTO;

@Service
public class ShoppingBasketServiceImpl implements ShoppingBasketService {
	
	@Autowired
	private ShoppingBasketDAO shoppingBasketDao;

	// 찜한 연극  목록
	@Override
	public List<PlayDTO> shoppingBasketList(int m_code) throws Exception {
		return shoppingBasketDao.shoppingBasketList(m_code);
	}
	
	// 찜한 연극 목록 페이징
	@Override
	public List<PlayDTO> shoppingBasketPaging(int m_code, PageDTO dto) throws Exception {
		return shoppingBasketDao.shoppingBasketPaging(m_code, dto);
	}
	
	// 총 목록 수
	@Override
	public int shoppingBasketCount(int m_code) throws Exception {
		return shoppingBasketDao.shoppingBasketCount(m_code);
	}

	// 찜한 연극 추가
	@Override
	public void insertBasket(ShoppingBasketDTO dto) throws Exception {
		shoppingBasketDao.insertBasket(dto);
	}

	// 장바구니 수정(필요없음)
	@Override
	public void updateBasket(ShoppingBasketDTO dto) throws Exception {
		shoppingBasketDao.updateBasket(dto);
	}

	// 찜한 연극  삭제
	@Override
	public void deleteBasket(int p_id) throws Exception {
		shoppingBasketDao.deleteBasket(p_id);
	}
	
	// 찜한 연극 목록에 동일 연극이 있는지 체크
	@Override
	public int countBasket(int m_code, int p_id) throws Exception {
		return shoppingBasketDao.countBasket(m_code, p_id);
	}

}
