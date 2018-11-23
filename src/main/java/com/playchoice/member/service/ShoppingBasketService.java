package com.playchoice.member.service;

import java.util.List;

import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.play.dto.PlayDTO;

public interface ShoppingBasketService {

	// 찜한 연극  목록
	public List<PlayDTO> shoppingBasketList(int m_code) throws Exception;
	
	// 찜한 연극 추가
	public void insertBasket(ShoppingBasketDTO dto) throws Exception;
	
	// 장바구니 수정(필요없음)
	public void updateBasket(ShoppingBasketDTO dto) throws Exception;
	
	// 찜한 연극  삭제
	public void deleteBasket(int p_id) throws Exception;
	
	// 찜한 연극 목록에 동일 연극이 있는지 체크
	public int countBasket(int m_code, int p_id) throws Exception;
	
}
