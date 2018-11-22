package com.playchoice.member.dao;

import java.util.List;

import com.playchoice.member.dto.ShoppingBasketDTO;

public interface ShoppingBasketDAO {

	// 장바구니 목록
	public List<ShoppingBasketDTO> ShoppingBasketList(int m_code) throws Exception;
	
	// 장바구니 조회
	public ShoppingBasketDTO viewBasket(int m_code) throws Exception;
	
	// 장바구니 추가
	public void insertBasket(ShoppingBasketDTO dto) throws Exception;
	
	// 장바구니 수정
	public void updateBasket(ShoppingBasketDTO dto) throws Exception;
	
	// 장바구니 삭제
	public void deleteBasket(int p_id) throws Exception;
	
	// 장바구니에 동일한 상품이 있는지 체크
	public int checkBasket(int m_code, int p_id) throws Exception;
	
}
