package com.playchoice.member.dao;

import java.util.List;

import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.play.dto.PlayDTO;

public interface ShoppingBasketDAO {

	// 장바구니 목록
	public List<PlayDTO> shoppingBasketList(int m_code) throws Exception;
	
	// 장바구니 추가
	public void insertBasket(ShoppingBasketDTO dto) throws Exception;
	
	// 장바구니 수정
	public void updateBasket(ShoppingBasketDTO dto) throws Exception;
	
	// 장바구니 삭제
	public void deleteBasket(int p_id) throws Exception;
	
	// 장바구니에 동일한 상품이 있는지 검사
	public int countBasket(int m_code, int p_id) throws Exception;
	
}
