package com.playchoice.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.play.dto.PlayDTO;

@Repository
public class ShoppingBasketDAOImpl implements ShoppingBasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mapper.basketMapper";

	// 장바구니 목록
	@Override
	public List<PlayDTO> shoppingBasketList(int m_code) throws Exception {
		return sqlSession.selectList(namespace + ".shoppingBasketList", m_code);
	}

	// 장바구니 추가
	@Override
	public void insertBasket(ShoppingBasketDTO dto) throws Exception {
		sqlSession.insert(namespace + ".insertBasket", dto);
	}

	// 장바구니 수정
	@Override
	public void updateBasket(ShoppingBasketDTO dto) throws Exception {
		sqlSession.update(namespace + ".updateBasket", dto);
	}

	// 장바구니 삭제
	@Override
	public void deleteBasket(int p_id) throws Exception {
		sqlSession.delete(namespace + ".deleteBasket", p_id);
	}
	
	// 장바구니에 동일한 상품이 있는지 검사
	@Override
	public int countBasket(int m_code, int p_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_code", m_code);
		map.put("p_id", p_id);
		return sqlSession.selectOne(namespace + ".countBasket", map);
	}

}
