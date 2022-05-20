package com.health.dao;

import java.util.List;
import java.util.Map;

import com.health.dto.CartDTO;
import com.health.dto.ProductDTO;

public interface CartDAO {

	List<CartDTO> cartQueryById(int m_num) throws Exception;
	
	ProductDTO prodQueryByProdNum(int prod_num) throws Exception;
	
	public void deleteCart(Map<String, Object> cartParam)throws Exception;
	
	void updateQuan(Map<String, Object> cartParam) throws Exception;

	void insertCart(Map<String, Object> cartParam) throws Exception;

	void deleteCartAll(int m_num)throws Exception;

	
	


}
